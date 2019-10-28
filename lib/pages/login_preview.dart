import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class LoginPreview extends StatefulWidget {

  final String title;

  LoginPreview(this.title, {Key key}) : super(key:key);


  @override
  _LoginPreviewState createState() => _LoginPreviewState();
}

class _LoginPreviewState extends State<LoginPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaVista(),
    );
  }

  Widget _cuerpoDeLaVista(){
    return Column(
      children: <Widget>[
        BackgroundSuperiorWidget(titulo: widget.title,),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
          child: Column(
            children: <Widget>[
              SizedBox(width: double.infinity,),
              Text("This Conference is for Registered Attendees only.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: RaisedButton(
                  
                ),
              )
            ],
          )
        ),
      ],
    );
  }

}