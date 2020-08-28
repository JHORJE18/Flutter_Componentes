import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listadoNumeros = [100, 200, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listados 🧰'),
        ),
        body: _crearLista(context),
      ),
    );
  }

  Widget _crearLista(BuildContext context) {
    return ListView.builder(
      itemCount: _listadoNumeros.length,
      itemBuilder: (context, index) {
        final numeroImagen = _listadoNumeros[index];
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image:
                NetworkImage('https://picsum.photos/id/$numeroImagen/500/300'));
      },
    );
  }
}
