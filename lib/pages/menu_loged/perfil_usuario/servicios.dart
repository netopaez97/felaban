import 'package:flutter/material.dart';

class ServiciosPerfilUsuarioPage extends StatefulWidget {

  final List _services;
  ServiciosPerfilUsuarioPage(this._services, {Key key});

  @override
  _ServiciosPerfilUsuarioPageState createState() => _ServiciosPerfilUsuarioPageState();
}

class _ServiciosPerfilUsuarioPageState extends State<ServiciosPerfilUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add services."),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: widget._services.length,
        itemBuilder: (context, item){
          return ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              initialValue: widget._services[item],
            ),
            subtitle: Divider(),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                setState(() {
                  widget._services.remove(widget._services[item]);
                });
              },
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Add another service."),
        onPressed: (){
          setState(() {
            widget._services.add("");
          });
          
        },
      ),
);
  }
}