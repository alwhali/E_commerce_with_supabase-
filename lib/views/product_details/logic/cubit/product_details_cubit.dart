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
  final currentUserId = Supabase.instance.client.auth.currentUser!.id;
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
      }

      _getAverageRates();
      _getUserRate();

      emit(GetRatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRatesFailure(error: e.toString()));
    }
  }

  void _getUserRate() {
    userRate =
        rates.where((rate) => rate.forUser == currentUserId).first.rate ?? 0;
    // for (var rate in rates) {
    //   if (rate.forUser == client.auth.currentUser!.id) {
    //     userRate = rate.rate!;
    //   }
    // }
  }

  void _getAverageRates() {
    for (var rate in rates) {
      if (rate.rate != null) {
        totalRate += rate.rate!;
      }
    }
    totalRate = totalRate / rates.length;
  }

  bool isThereRate(String productId) {
    for (var rate in rates) {
      if (rate.forUser == currentUserId && rate.forProduct == productId) {
        return true;
      }
    }
    return false;
  }

  Future<void> addOrUpdateUserRate({
    required String productId,
    required Map<String, dynamic> data,
  }) async {
    emit(AddOrUpdateUserRateLoading());
    try {
      path =
          'rates?select=*&for_user=eq.0b8cdd4d-41c0-483a-a1d5-99fbad13340b&for_product=eq.2e84d116-5e6d-4ff4-9eb7-2f9fc6153b51';
      if (isThereRate(productId)) {
        // update rate (patch)
        await _apiServices.patchData(path, data);
      } else {
        // add rate
      }
    } catch (e) {
      log(e.toString());
      emit(AddOrUpdateUserRateFailure(error: e.toString()));
    }
  }
}
