part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsLoading extends HomeState {}

final class GetProductsSuccess extends HomeState {}

final class GetProductsError extends HomeState {
  final String message;
  GetProductsError({required this.message});
}

final class GetFavoriteProductsLoading extends HomeState {}

final class GetFavoriteProductsSuccess extends HomeState {}

final class GetFavoriteProductsError extends HomeState {
  final String message;
  GetFavoriteProductsError({required this.message});
}

final class SearchProductLoading extends HomeState {}

final class SearchProductSuccess extends HomeState {}

final class SearchProductError extends HomeState {
  final String message;
  SearchProductError({required this.message});
}

final class SearchProductByCategoryLoading extends HomeState {}

final class SearchProductByCategorySuccess extends HomeState {}

final class SearchProductByCategoryError extends HomeState {
  final String message;
  SearchProductByCategoryError({required this.message});
}

final class AddToFavoriteLoading extends HomeState {}

final class AddToFavoriteSuccess extends HomeState {}

final class AddToFavoriteError extends HomeState {
  final String message;
  AddToFavoriteError({required this.message});
}

final class RemveFromFavoriteLoading extends HomeState {}

final class RemveFromFavoriteSuccess extends HomeState {}

final class RemveFromFavoriteError extends HomeState {
  final String message;
  RemveFromFavoriteError({required this.message});
}
