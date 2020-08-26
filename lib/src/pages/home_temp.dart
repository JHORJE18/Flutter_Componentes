import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Componentes Temp 💪')),
        body: ListView(
          children: [
            ListTile(
              title: Text('Listado épico!'),
            ),
            Divider(),
            ListTile(
              title: Text('Listado épico!'),
            ),
            Divider(),
            ListTile(
              title: Text('Listado épico!'),
            ),
          ],
        ),
      ),
    );
  }
}
