import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_services.dart';
import 'package:e_commerce_app/views/product_details/logic/models/comment_model.dart';
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
  RateModel? userRate;
  List<CommentModel> comments = [];

  Future<void> getRates({required String productId}) async {
    emit(GetRatesLoading());
    try {
      final data = await _apiServices.getData(
        'rates?select=*&for_product=eq.$productId',
      );

      for (var rate in data as List) {
        rates.add(RateModel.fromJson(rate));
      }

      getAverageRates();
      getUserRate();

      emit(GetRatesSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRatesFailure(error: e.toString()));
    }
  }

  void getUserRate() {
    userRate = rates.where((rate) => rate.forUser == currentUserId).first;
    // for (var rate in rates) {
    //   if (rate.forUser == client.auth.currentUser!.id) {
    //     userRate = rate.rate!;
    //   }
    // }
  }

  void getAverageRates() {
    for (var rate in rates) {
      if (rate.rate != null) {
        totalRate += rate.rate!;
      }
    }
    if (totalRate != 0) {
      totalRate = totalRate / rates.length;
    }
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
      String path =
          'rates?select=*&for_user=eq.$currentUserId&for_product=eq.$productId';
      if (isThereRate(productId)) {
        // update rate (patch)
        await _apiServices.patchData(path, data);
      } else {
        // add rate
        await _apiServices.postData(path, data);
      }

      rates = [];
      totalRate = 0;
      userRate = null;

      await getRates(productId: productId);

      emit(AddOrUpdateUserRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrUpdateUserRateFailure(error: e.toString()));
    }
  }

  Future<void> addComment({
    required String productId,
    required Map<String, dynamic> data,
  }) async {
    emit(AddCommentLoading());
    try {
      await _apiServices.postData("comments", data);
      comments = [];
      getComments(productId: productId);
      emit(AddCommentSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddCommentFailure(error: e.toString()));
    }
  }

  Future<void> getComments({required String productId}) async {
    emit(GetCommentLoading());
    try {
      final data = await _apiServices.getData(
        'comments?select=*&for_product=eq.$productId',
      );

      for (var comment in data as List) {
        comments.add(CommentModel.fromJson(comment));
      }

      emit(GetCommentSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetCommentFailure(error: e.toString()));
    }
  }
}
