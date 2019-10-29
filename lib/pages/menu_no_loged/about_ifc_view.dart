import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutIFCView extends StatefulWidget {
  static const routeName = '/about_ifc';

  @override
  _AboutIFCViewState createState() => _AboutIFCViewState();
}

class _AboutIFCViewState extends State<AboutIFCView> {
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
                'assets/images/ifc_logo.png',
                width: _screenSize.width
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              color: Color(0xFFF0F0F0),
              height: 70.0,
              child: Text(
                "International Finance Corporation: IFC",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto-Medium',
                    letterSpacing: -0.5),
              ),
            ),
            Divider(height: 6,),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 40, 15, 30),
                    child: Text(
                      "A strong and engaged private sector is indispensable to ending extreme poverty and boosting shared prosperity. That’s where IFC comes in—we have more than 60 years of experience in unlocking private investment, creating markets and opportunities where they’re needed most. Since 1956, IFC has leveraged \$2.6 billion in capital to deliver more than \$285 billion in financing for businesses in developing countries.",
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium', fontSize: 18.0),
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
