import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/pages/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return ListView(
      children: <Widget>[
        BackgroundSuperiorWidget(titulo: widget.title, negrita: true,),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("This Conference is for Registered Attendees only.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              SizedBox(height: 29,),
              Container(
                height: 52,
                child: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  borderRadius: BorderRadius.zero,
                  color: Color(0xff29983A),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginView(widget.title)
                    ));
                  },
                  child: Text("OK, I'M REGISTERED", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 84,),
              Text("I’m not registered and would like to attend.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
              SizedBox(height: 29,),
              Container(
                height: 52,
                child: CupertinoButton(
                  color: Color(0XFFA1A1A1),
                  padding: EdgeInsets.all(0),
                  borderRadius: BorderRadius.zero,
                  onPressed: (){
                    const url = 'https://registro.felaban.net/';
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text("REGISTER NOW", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ),
      ],
    );
  }

}