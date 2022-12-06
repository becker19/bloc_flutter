import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/producto_model.dart';
import 'package:meta/meta.dart';

part 'producto_event.dart';
part 'producto_state.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {
  ProductoBloc() : super(const ProductoInitial()) {
    // on<ProductoEvent>((event, emit) {});

    on<ActiveProducto>((event, emit) => emit(ProductoSetState(event.producto)));

    on<BorrarProducto>((event, emit) => emit(const ProductoInitial()));

    on<CambioProductoStock>((event, emit) {
      if (!state.existeProducto) return;
      emit(ProductoSetState(state.producto!.copyWith(stock: event.stock)));
    });
    on<AgregarProducto>((event, emit) {
      if (!state.existeProducto) return;

      final products = [...state.producto!.productos, event.producto];
      emit(ProductoSetState(state.producto!.copyWith(productos: products)));
    });
  }
}
