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

final class AddCommentLoading extends ProductDetailsState {}

final class AddCommentSuccess extends ProductDetailsState {}

final class AddCommentFailure extends ProductDetailsState {
  final String error;
  AddCommentFailure({required this.error});
}

final class GetCommentLoading extends ProductDetailsState {}

final class GetCommentSuccess extends ProductDetailsState {}

final class GetCommentFailure extends ProductDetailsState {
  final String error;
  GetCommentFailure({required this.error});
}
