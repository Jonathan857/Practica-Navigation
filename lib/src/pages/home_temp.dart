import 'package:flutter/material.dart';
import 'package:navigation_flutter/src/pages/alert_page.dart';
import 'package:navigation_flutter/src/providers/menu_provider.dart';
import 'package:navigation_flutter/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(context),
    );
  }
  
  Widget _list(BuildContext context){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listI(snapshot.data, context),
        );
      }
    );
  }

  List<Widget> _listI(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];
    data.forEach((otp) {
      final widgetTemp = ListTile(
        title: Text(otp['texto']),
        leading: getIcon(otp['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.lightBlueAccent,
        ),
        onTap: (){
          Navigator.pushNamed(context, otp['ruta']);
          },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _dialog(BuildContext context, String otp){
    return new AlertDialog(
      title: const Text('Alerta De Dialogo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Es La Opción: '+ otp),
        ],
      ),
      actions: <Widget>[
         TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}