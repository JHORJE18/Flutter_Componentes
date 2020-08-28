import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listadoNumeros = new List();
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _agregarImagenes();
      }
    });
  }

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
      controller: _scrollController,
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

  _agregarImagenes() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listadoNumeros.add(_ultimoItem);
    }

    setState(() {});
  }
}
