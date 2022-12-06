part of 'producto_bloc.dart';

@immutable
abstract class ProductoEvent {}

class ActiveProducto extends ProductoEvent {
  final Producto producto;
  ActiveProducto(this.producto);
}

class CambioProductoStock extends ProductoEvent {
  final int stock;
  CambioProductoStock(this.stock);
}

class AgregarProducto extends ProductoEvent {
  final String producto;
  AgregarProducto(this.producto);
}

class BorrarProducto extends ProductoEvent {}
