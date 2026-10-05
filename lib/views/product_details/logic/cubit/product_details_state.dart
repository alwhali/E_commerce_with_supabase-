part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetAllRatesProdLoading extends ProductDetailsState {}

final class GetAllRatesProdSuccess extends ProductDetailsState {}

final class GetAllRatesProdFailure extends ProductDetailsState {
  final String error;
  GetAllRatesProdFailure({required this.error});
}

final class GetTotalRateLoading extends ProductDetailsState {}

final class GetTotalRateSuccess extends ProductDetailsState {}

final class GetTotalRateFailure extends ProductDetailsState {
  final String error;
  GetTotalRateFailure({required this.error});
}

final class GetUserRateLoading extends ProductDetailsState {}

final class GetUserRateSuccess extends ProductDetailsState {}

final class GetUserRateFailure extends ProductDetailsState {
  final String error;
  GetUserRateFailure({required this.error});
}
