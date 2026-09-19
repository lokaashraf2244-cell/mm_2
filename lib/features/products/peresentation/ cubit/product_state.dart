import 'package:mm_2/features/products/data/models/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductSuccessState extends ProductState {
  final List<Product> products;
  ProductSuccessState(this.products);
}
class ProductFailureState extends ProductState {
  final String message;
  ProductFailureState(this.message);
}