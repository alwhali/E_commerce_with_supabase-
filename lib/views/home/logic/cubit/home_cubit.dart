import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_services.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

enum EnumSearchType { name, category }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  List<ProductModel> foundProducts = [];

  Future<void> getProducts({
    String? query = "",
    EnumSearchType? type = EnumSearchType.name,
  }) async {
    emit(GetProductsLoading());
    try {
      final data = await _apiServices.getData(
        'products?select=*,favorite_products(*),purchases(*),comments(*)',
      );
      // log('Data is ${data.toString()}');
      for (var product in data as List) {
        products.add(ProductModel.fromMap(product));
      }
      if (type == EnumSearchType.name) {
        searchProduct(query: query);
      } else if (type == EnumSearchType.category) {
        searchProductByCategory(category: query);
      }
      emit(GetProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsError(message: e.toString()));
    }
  }

  void searchProduct({String? query = ""}) {
    emit(SearchProductLoading());
    foundProducts.clear();
    try {
      if (query != null && query != "") {
        for (var product in products) {
          if (product.name!.toLowerCase().contains(query.toLowerCase())) {
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
}
