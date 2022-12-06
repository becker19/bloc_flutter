import 'package:bloc_flutter/bloc/producto/producto_bloc.dart';
import 'package:bloc_flutter/model/producto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoBloc = BlocProvider.of<ProductoBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productoBloc.add(BorrarProducto());
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: BlocBuilder<ProductoBloc, ProductoState>(builder: (_, state) {
        return state.existeProducto
            ? InfoProducto(producto: state.producto!)
            : const Center(
                child: Text('No hay Información'),
              );
      }),
      floatingActionButton: SizedBox(
          height: 200,
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  final newProducto = Producto(
                      nombre: 'Naruto',
                      tpago: 'Boleta',
                      stock: 8,
                      productos: ['CocaCola']);

                  productoBloc.add(ActiveProducto(newProducto));
                },
                child: const Icon(Icons.star_rate),
              ),
              FloatingActionButton(
                onPressed: () {
                  productoBloc.add(CambioProductoStock(5));
                },
                child: const Icon(Icons.numbers),
              ),
              FloatingActionButton(
                onPressed: () {
                  productoBloc.add(AgregarProducto('Oreo'));
                },
                child: const Icon(Icons.add),
              ),
            ],
          )),
    );
  }
}

class InfoProducto extends StatelessWidget {
  final Producto producto;

  const InfoProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            child: Column(
              children: [
                const Text(
                  'Cliente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: Text('Nombre: ${producto.nombre}'),
                ),
                ListTile(
                  title: Text('C. Pago: ${producto.tpago} '),
                ),
                ListTile(
                  title: Text('Stock: ${producto.stock} '),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Column(
              children: [
                const Text(
                  'Productos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ...producto.productos
                    .map(
                      (e) => ListTile(title: Text(e)),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
