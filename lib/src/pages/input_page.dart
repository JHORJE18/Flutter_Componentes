import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs 📝'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: [
          ListTile(
            title: Text('Hola $_nombre'),
          ),
          Divider(),
          SizedBox(height: 10),
          _crearInput(),
          Divider(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre y apellidos',
          labelText: 'Nombre',
          helperText: 'Introduce tu nombre y apellidos',
          suffixIcon: Icon(Icons.accessibility_new),
          icon: Icon(Icons.tag_faces)),
      onChanged: (value) {
        _nombre = value;
        setState(() {});
      },
    );
  }
}
