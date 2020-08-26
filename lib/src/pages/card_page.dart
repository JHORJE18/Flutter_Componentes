import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards 📮'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo01(),
          SizedBox(height: 5.0),
          _cardTipo02(),
        ],
      ),
    );
  }

  Widget _cardTipo01() => Card(
        elevation: 3.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.photo_album, color: Colors.black),
              title: Text('Soy el titulo de primera tarjeta'),
              subtitle: Text(
                  'La primera tarjeta es bastante interesante dado que aparecera arriba. Si si, esta descripción es algo extensa para realiar pruebas 😸'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      );

  Widget _cardTipo02() => Card(
        elevation: 3.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage('https://i.imgur.com/RpqynFr.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 500),
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Text('Imagen de alta resolución'))
          ],
        ),
      );
}
