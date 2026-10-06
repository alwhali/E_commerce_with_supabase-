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

final class AddOrUpdateUserRateLoading extends ProductDetailsState {}

final class AddOrUpdateUserRateSuccess extends ProductDetailsState {}

final class AddOrUpdateUserRateFailure extends ProductDetailsState {
  final String error;
  AddOrUpdateUserRateFailure({required this.error});
}
