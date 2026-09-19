import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/products/domain/usecase/get_products.dart';
import 'package:mm_2/features/products/data/models/screen_product.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductCubit(this.getProducts) : super(ProductInitialState());

  Future<void> fetchProducts() async {
    emit(ProductLoadingState());

    final result = await getProducts();

    result.fold(
          (failure) {
        emit(ProductFailureState(failure.msg));
      },
          (data) {
        try {
          final response = screenproduct.fromJson(data);

          emit(ProductSuccessState(response.items));
        } catch (e) {
          emit(ProductFailureState(e.toString()));
        }
      },
    );
  }
}