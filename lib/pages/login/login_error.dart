import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginErrorView extends StatefulWidget {

  final String title;

  LoginErrorView(this.title, {Key key}) : super(key:key);


  @override
  _LoginErrorViewState createState() => _LoginErrorViewState();
}

class _LoginErrorViewState extends State<LoginErrorView> {

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        BackgroundSuperiorWidget(titulo: widget.title, negrita: true,),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
            child: ListView(
              children: <Widget>[
                Text("We’re sorry but you are not participating on this Conference.", textAlign: TextAlign.center, style: TextStyle(fontSize: 17),),
                SizedBox(height: 29,),
                Container(
                  height: 52,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0XFFA1A1A1),
                    onPressed: (){
                      const url = 'https://registro.felaban.net/';
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text("REGISTER NOW", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
              ],
            )
          ),
        ),
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Are you having troubles accessing the Conference?", style: TextStyle(fontSize: 17),textAlign: TextAlign.center ,),
                Text("Please contact us:\n", style: TextStyle(fontSize: 17),textAlign: TextAlign.center ,),
                FlatButton(
                  onPressed: (){
                    _launchURL('soporte@felaban.net', 'Troubles accessing to the conference ${widget.title}', 'Hello, I am ');
                  },
                  child: Text("soporte@felaban.net", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),textAlign: TextAlign.center ,),
                )
              ],
            )
          ),
      ],
    );
  }

}