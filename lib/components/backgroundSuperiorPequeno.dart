import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackgroundSuperiorPequenoWidget extends StatefulWidget {

  @override
  _BackgroundSuperiorPequenoWidgetState createState() => _BackgroundSuperiorPequenoWidgetState();
}

class _BackgroundSuperiorPequenoWidgetState extends State<BackgroundSuperiorPequenoWidget> {


  @override
  Widget build(BuildContext context) {

    final eventoInfo = Provider.of<EventosProvider>(context);
    final EventosModel eventoActual = eventoInfo.eventoActual;
    
    final _sizeScreen = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: Container(
        //height: 0.2,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              width: double.infinity,
              child: Image.asset(
                "assets/background.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            /* Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: _paddingParaLogosYTexto,left: _paddingParaLogosYTexto),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: _sizeScreen.height*0.02),
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/clab.png",
                        width: 100000,
                      ),
                    )
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/felabanLogo.png",
                          ),
                          height: _sizeScreen.height*0.08,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/images/fiba.png",
                          ),
                          height: _sizeScreen.height*0.08,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ), */
            Container(
              width: _sizeScreen.width*0.7,
              padding: EdgeInsets.only(top: _sizeScreen.height*0.02, left: 10, bottom: 20),
              child: Image.asset(
                eventoActual.imagenGrande,
                width: 263,
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: _sizeScreen.height*0.01, right: _sizeScreen.height*0.01),
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      "assets/felabanLogo.png",
                      width: 81,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/images/fiba.png",
                      width: 81,
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}