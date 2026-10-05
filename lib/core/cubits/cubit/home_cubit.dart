import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_services.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  Future<void> getData() async {
    emit(GetDataLoading());
    try {
      final data = await _apiServices.getData(
        'products?select=*,favorite_products(*),purchases(*),comments(*)',
      );
      // log('Data is ${data.toString()}');
      for (var product in data as List) {
        products.add(ProductModel.fromMap(product));
      }
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError(message: e.toString()));
    }
  }
}
