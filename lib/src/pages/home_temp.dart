import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Componentes Temp 💪')),
        body: ListView(
          children: _crearListado(),
        ),
      ),
    );
  }

  List<Widget> _crearListado() {
    List<Widget> listado = new List<Widget>();

    for (String opt in opciones) {
      final ListTile tempWidget = ListTile(
        title: Text('$opt'),
      );
      listado..add(tempWidget)..add(Divider());
    }

    return listado;
  }
}
