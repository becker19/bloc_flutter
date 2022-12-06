class Producto {
  final String nombre;
  final String tpago;
  final int stock;
  final List<String> productos;

  Producto({
    required this.nombre,
    required this.tpago,
    required this.stock,
    required this.productos,
  });

  Producto copyWith({
    String? nombre,
    String? tpago,
    int? stock,
    List<String>? productos,
  }) =>
      Producto(
          nombre: nombre ?? this.nombre,
          tpago: tpago ?? this.tpago,
          stock: stock ?? this.stock,
          productos: productos ?? this.productos);
}
