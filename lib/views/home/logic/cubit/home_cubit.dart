import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_services.dart';
import 'package:e_commerce_app/models/product_model/favorite_product.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/logic/user_model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

enum EnumSearchType { name, category }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  List<ProductModel> foundProducts = [];
  List<ProductModel> favoriteProducts = [];

  UserModel? user = AuthCubit().currentUser;
  //or you can use this
  String userId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getProducts({
    String? query = "",
    EnumSearchType? type = EnumSearchType.name,
  }) async {
    emit(GetProductsLoading());
    try {
      products.clear();
      final data = await _apiServices.getData(
        'products?select=*,favorite_products(*),purchases(*),comments(*)',
      );
      // log('Data is ${data.toString()}');
      for (var product in data as List) {
        products.add(ProductModel.fromMap(product));
      }
      if (type == EnumSearchType.name) {
        searchProduct(name: query);
      } else if (type == EnumSearchType.category) {
        searchProductByCategory(category: query);
      }

      getFavoriteProducts();
      emit(GetProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsError(message: e.toString()));
    }
  }

  double discountOfProduct(double price, double discount) {
    double discontOfPro = price * (discount / 100);
    return discontOfPro;
  }

  double priceAfterDiscount(double price, double discount) {
    return price - discountOfProduct(price, discount);
  }

  void getFavoriteProducts() {
    emit(GetFavoriteProductsLoading());
    try {
      favoriteProducts.clear();
      for (ProductModel product in products) {
        if (product.favoriteProducts != null &&
            product.favoriteProducts!.isNotEmpty) {
          for (FavoriteProductModel favoriteProduct
              in product.favoriteProducts!) {
            if (favoriteProduct.forUser == userId) {
              favoriteProducts.add(product);
            }
          }
        }
      }
      emit(GetFavoriteProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetFavoriteProductsError(message: e.toString()));
    }
  }

  bool isFavorite(String productId) {
    // return favoriteProductsId.contains(productId);
    return favoriteProducts.any((element) => element.productId == productId);
  }

  void searchProduct({String? name = ""}) {
    emit(SearchProductLoading());
    foundProducts.clear();
    try {
      if (name != null && name != "") {
        for (var product in products) {
          if (product.name!.toLowerCase().contains(name.toLowerCase())) {
            foundProducts.add(product);
          }
        }
      }
      emit(SearchProductSuccess());
    } catch (e) {
      log(e.toString());
      emit(SearchProductError(message: e.toString()));
    }
  }

  void searchProductByCategory({String? category = ""}) {
    emit(SearchProductByCategoryLoading());
    foundProducts.clear();
    try {
      if (category != null && category != "") {
        for (var product in products) {
          if (product.category!.toLowerCase().contains(
            category.toLowerCase(),
          )) {
            foundProducts.add(product);
          }
        }
      }
      emit(SearchProductByCategorySuccess());
    } catch (e) {
      log(e.toString());
      emit(SearchProductByCategoryError(message: e.toString()));
    }
  }

  Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLoading());
    try {
      await _apiServices.postData("favorite_products", {
        "is_favorite": true,
        "for_user": userId,
        "for_product": productId,
      });
      // await getProducts();
      favoriteProducts.add(
        products.firstWhere((element) => element.productId == productId),
      );

      emit(AddToFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError(message: e.toString()));
    }
  }

  Future<void> remveFromFavorite(String productId) async {
    emit(RemveFromFavoriteLoading());
    try {
      await _apiServices.deleteData(
        "favorite_products?for_user=eq.$userId&for_product=eq.$productId",
      );
      // await getProducts();
      favoriteProducts.removeWhere((element) => element.productId == productId);

      emit(RemveFromFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemveFromFavoriteError(message: e.toString()));
    }
  }
}
