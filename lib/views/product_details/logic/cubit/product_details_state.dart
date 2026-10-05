part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetRatesLoading extends ProductDetailsState {}

final class GetRatesSuccess extends ProductDetailsState {}

final class GetRatesFailure extends ProductDetailsState {
  final String error;
  GetRatesFailure({required this.error});
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
