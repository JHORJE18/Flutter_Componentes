import 'dart:async';

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

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listados 🧰'),
        ),
        body: Stack(
          children: [_crearLista(context), _crearLoading()],
        ),
      ),
    );
  }

  Widget _crearLista(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listadoNumeros.length,
        itemBuilder: (context, index) {
          final numeroImagen = _listadoNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image:
                NetworkImage('https://picsum.photos/id/$numeroImagen/500/300'),
            height: 300,
            fit: BoxFit.fitHeight,
          );
        },
      ),
    );
  }

  Future<Null> _obtenerPagina() async {
    final Duration duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listadoNumeros.clear();
      _ultimoItem++;
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 25,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  _agregarImagenes() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listadoNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    return new Timer(Duration(seconds: 2), _respuestaHttp);
  }

  void _respuestaHttp() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    _agregarImagenes();
  }
}
