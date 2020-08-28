import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';

  TextEditingController _inputFieldDateController = new TextEditingController();

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
            subtitle: Row(
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 5,
                ),
                Text('$_email')
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          _crearInput(),
          Divider(),
          SizedBox(height: 10),
          _crearEmail(),
          Divider(),
          SizedBox(height: 10),
          _crearPassword(),
          Divider(),
          SizedBox(height: 10),
          _crearFecha(context),
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

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'your@mail.com',
          labelText: 'E-mail',
          helperText: 'Introduce dirección de correo electrónico.',
          icon: Icon(Icons.mail)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '********',
          labelText: 'Contraseña',
          helperText: 'Introduce una contraseña válida.',
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '00/00/0000',
          labelText: 'Fecha nacimiento',
          helperText: 'Introduce tu fecha de nacimiento.',
          icon: Icon(Icons.date_range)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputFieldDateController,
    );
  }

  void _selectDate(context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1950),
        lastDate: new DateTime.now(),
        locale: Locale('es'));

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldDateController.text = '$_fecha';
      setState(() {});
    }
  }
}
