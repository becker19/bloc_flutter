part of 'producto_bloc.dart';

@immutable
abstract class ProductoState {
  final bool existeProducto;
  final Producto? producto;

  const ProductoState({this.existeProducto = false, this.producto});
}

class ProductoInitial extends ProductoState {
  const ProductoInitial() : super(existeProducto: false, producto: null);
}

class ProductoSetState extends ProductoState {
  final Producto newProducto;
  const ProductoSetState(this.newProducto)
      : super(existeProducto: true, producto: newProducto);
}
