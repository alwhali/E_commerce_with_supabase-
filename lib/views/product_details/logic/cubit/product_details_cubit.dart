import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_services.dart';
import 'package:e_commerce_app/views/product_details/logic/models/rate_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  final SupabaseClient client = Supabase.instance.client;
  List<RateModel> rates = [];
  double totalRate = 0;
  int userRate = 0;

  Future<void> getRates({required String productId}) async {
    emit(GetRatesLoading());
    try {
      final data = await _apiServices.getData(
        'rates?select=*&for_product=eq.$productId',
      );

      for (var rate in data as List) {
        rates.add(RateModel.fromJson(rate));
        // if (rate.rate != null) {
        //   totalRate += rate.rate!;
        // }
        // if (rate.forUser == client.auth.currentUser!.id) {
        //   userRate = rate.rate!;
        // }
      }
      // totalRate = totalRate / rates.length;
      getAverageRates();
      getUserRate();

      emit(GetRatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRatesFailure(error: e.toString()));
    }
  }

  void getUserRate() {
    for (var rate in rates) {
      if (rate.forUser == client.auth.currentUser!.id) {
        userRate = rate.rate!;
      }
    }
  }

  void getAverageRates() {
    for (var rate in rates) {
      if (rate.rate != null) {
        totalRate += rate.rate!;
      }
    }
    totalRate = totalRate / rates.length;
  }
}
