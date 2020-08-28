import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valor = 50.0;
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders 🧬')),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valor,
      activeColor: Colors.amberAccent,
      label: 'Tamaño imagen',
      min: 50,
      max: 500,
      onChanged: (_checked)
          ? null
          : (double value) {
              _valor = value;
              setState(() {});
            },
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      value: _checked,
      title: Text('Bloquear slider'),
      onChanged: (value) {
        _checked = value;
        setState(() {});
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _checked,
      title: Text('Bloquear slider'),
      onChanged: (value) {
        _checked = value;
        setState(() {});
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
        image: NetworkImage(
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8248f6c2-4b03-4976-9cda-cd298f1b0a28/daf4in6-b6d317af-ad61-47bf-a17e-4e3edaec4a93.png/v1/fill/w_1024,h_515,strp/back_to_the_future_1985_delorean_png_by_ent2pri9se_daf4in6-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD01MTUiLCJwYXRoIjoiXC9mXC84MjQ4ZjZjMi00YjAzLTQ5NzYtOWNkYS1jZDI5OGYxYjBhMjhcL2RhZjRpbjYtYjZkMzE3YWYtYWQ2MS00N2JmLWExN2UtNGUzZWRhZWM0YTkzLnBuZyIsIndpZHRoIjoiPD0xMDI0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.uiGipAueHAWiZC1sXc6kU2wh4QjojdS7EY_3ahDEeL8'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        width: _valor,
        fit: BoxFit.contain);
  }
}
