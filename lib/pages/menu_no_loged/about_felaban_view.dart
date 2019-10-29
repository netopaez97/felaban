import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutFelabanView extends StatefulWidget {
  static const routeName = '/about_felaban';

  @override
  _AboutFelabanViewState createState() => _AboutFelabanViewState();
}

class _AboutFelabanViewState extends State<AboutFelabanView> {


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Color(0xff8C8C8C),
        actionsForegroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[
              Icon(CupertinoIcons.back,),
              Text("Back", style: TextStyle(fontSize: 16, color: Colors.white),)
            ],
          ),
        ),
        border: Border.all(
          style: BorderStyle.none
        ),
        padding: EdgeInsetsDirectional.zero,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
                height: _screenSize.height*0.2,
              child: Image.asset(
                'assets/images/felaban_logo.png',
                width: _screenSize.width
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                color: Color(0xFFF0F0F0),
                height: 70.0,
                child: Text(
                  "Federación Latinoamericana de Bancos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto-Medium',
                      letterSpacing: -0.5),
                ),
              ),
            ),
            Divider(height: 6,),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 40, 15, 30),
                    child: Text(
                      "La Federación Latinoamericana de Bancos, FELABAN, es una institución sin fines de lucro, constituida en 1965 en la ciudad de Mar del Plata, República Argentina. Agrupa, a través de sus respectivas asociaciones en 19 países del continente, a más de 623 bancos y entidades financieras de América Latina.",
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium', fontSize: 18.0),
                    ),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'www.felaban.com',
                            style: TextStyle(
                              fontFamily: 'Roboto-Black',
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                const url = 'http://www.felaban.com';
                                if (canLaunch(url) != null) {
                                  launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    child: 
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  color: Color(0xffC4C4C4),
                                  onPressed: (){},
                                  child: Text(
                                    "EMAIL",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  color: Color(0xffC4C4C4),
                                  onPressed: (){
                                    print(_screenSize.height*0.1);
                                  },
                                  child: Text(
                                    "WEBSITE",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                  ),
    );
  }
}
