import 'package:flutter/material.dart';

class BackgroundSuperiorWidget extends StatefulWidget {

  final String titulo;
  final bool negrita;

  BackgroundSuperiorWidget({Key key, this.titulo, this.negrita}) : super(key: key);

  @override
  _BackgroundSuperiorWidgetState createState() => _BackgroundSuperiorWidgetState();
}

class _BackgroundSuperiorWidgetState extends State<BackgroundSuperiorWidget> {

  Text _mostrarTextoCentral(){
    if(widget.negrita){
      return Text(
        widget.titulo,
        style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      );
    }
    else{
      return Text(
        widget.titulo,
        style: TextStyle(color: Colors.white, fontSize: 17),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final double _paddingParaLogosYTexto = MediaQuery.of(context).size.width*0.05;

    return Container(
      height: MediaQuery.of(context).size.height*0.3,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: _paddingParaLogosYTexto, vertical: _paddingParaLogosYTexto),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: _mostrarTextoCentral()
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: _paddingParaLogosYTexto,left: _paddingParaLogosYTexto),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    "assets/felabanLogo.png"
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/IFCLogo.png",
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width*0.62,
            child: Container(
              padding: EdgeInsets.only(top: _paddingParaLogosYTexto),
              child: Text("FEALABAN app Sponsored By", style: TextStyle(color: Colors.white,fontSize: 9),),
            ),
          )
        ],
      ),
    );
  }
}