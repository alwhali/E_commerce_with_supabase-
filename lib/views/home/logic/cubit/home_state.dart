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

final class addToFavoriteLoading extends HomeState {}

final class addToFavoriteSuccess extends HomeState {}

final class addToFavoriteError extends HomeState {
  final String message;
  addToFavoriteError({required this.message});
}
