import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page 🛑'),
      ),
      body: Column(children: [
        Spacer(),
        Center(
            child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        )),
        Center(
          child: RaisedButton(
              child: Text('Mostrar iOS Alert'),
              shape: StadiumBorder(),
              onPressed: () => _mostrarCupertinoAlert(context)),
        ),
        Spacer()
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('Titulo de la alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido de la caja de la alerta'),
              FlutterLogo(size: 50)
            ],
          ),
          actions: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _mostrarCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Titulo de la alerta'),
          content: Column(
            children: [
              SizedBox(height: 10),
              Text(
                  'iOS cuenta con un estilo para las alertas bastante bonido desde mi punto de vista, por lo que es muy interesante que se pueda adaptar a Android.')
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancelar'),
              isDestructiveAction: true,
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}
