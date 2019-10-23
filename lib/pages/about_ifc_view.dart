import 'package:felaban/components/app_drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutIFCView extends StatefulWidget {
  static const routeName = '/about_ifc';

  @override
  _AboutIFCViewState createState() => _AboutIFCViewState();
}

class _AboutIFCViewState extends State<AboutIFCView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About IFC",
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
                'assets/images/ifc_logo.png',
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
                  "International Finance Corporation: IFC",
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
                      "A strong and engaged private sector is indispensable to ending extreme poverty and boosting shared prosperity. That’s where IFC comes in—we have more than 60 years of experience in unlocking private investment, creating markets and opportunities where they’re needed most. Since 1956, IFC has leveraged 2.6 billion in capital to deliver more than 285 billion in financing for businesses in developing countries.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium', fontSize: 17.0),
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 130.0, right: 20, left: 20),
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
