import 'package:felaban/components/app_drawer.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Felaban",
          style: TextStyle(
            fontFamily: 'Roboto-Medium',
          ),
        ),
        actions: <Widget>[
          // action button
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/felaban_logo.png',
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                color: Color(0xFFF0F0F0),
                height: 60.0,
                child: Text(
                  "Federación Latinoamericana de Bancos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto-Medium',
                      letterSpacing: -0.5),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 40, 20, 30),
                    child: Text(
                      "La Federación Latinoamericana de Bancos, FELABAN, es una institución sin fines de lucro, constituida en 1965 en la ciudad de Mar del Plata, República Argentina. Agrupa, a través de sus respectivas asociaciones en 19 países del continente, a más de 623 bancos y entidades financieras de América Latina.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium', fontSize: 17.0),
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
                  Container(
                    margin: EdgeInsets.only(top: 130.0,right: 20, left: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  onPressed: null,
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
                                  onPressed: null,
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
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
