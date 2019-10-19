import 'package:felaban/fonts/login_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {

  //MyHomePage({Key key, this.title}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      automaticallyImplyMiddle:true,
      backgroundColor: Color(0xff8C8C8C),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              print("object");
            },
            color:Colors.white
          ),
          Text("Back",style:TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget _cuerpoDeLaVista(){
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _stackSuperior(),
          _textoAccesoConHuellaDigitalOReconocimientoFacial(),
          _imagenAccesoConHuellaDigitalOReconocimientoFacial(),
          _botonCorreoElectronico(),
          SizedBox(height: 1,),
          _botonContrasena(),
          _botonNext(),
          _nuevoUsuarioOlvidoPass(),
          Icon(LoginIcons.key),
        ],
      ),
    );
  }

  Widget _stackSuperior(){

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
            child: Text(
              "Welcome to the FELABAN APP",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            )
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

  Widget _textoAccesoConHuellaDigitalOReconocimientoFacial(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
      height: MediaQuery.of(context).size.height*0.13,
      alignment: Alignment.center,
      child: Text(
        "Log in to access your networking profile and customize the app for your event experience",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _imagenAccesoConHuellaDigitalOReconocimientoFacial(){

    final double tamanoIconos = MediaQuery.of(context).size.height*0.1;

    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.1, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: tamanoIconos,
              child: IconButton(
                icon: Image.asset("assets/reconocimientoFacial.png",width: tamanoIconos,fit: BoxFit.fitHeight,),
                onPressed: (){},
                iconSize: tamanoIconos,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: tamanoIconos,
              child: IconButton(
                icon: Image.asset("assets/huellaDigital.png",width: tamanoIconos, fit: BoxFit.fitHeight,),
                onPressed: (){},
                iconSize: tamanoIconos,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botonCorreoElectronico(){
    return Container(
      padding: EdgeInsets.only(left:10),
      alignment: Alignment.center,
      color: Colors.black12,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(LoginIcons.user),
          //hintText: 'Example: felaban@feleaban.com',
          labelText: 'Username (your email)',
        ),
        onSaved: (String value) {
          
        },
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Please, type a correct email';
          }
          return null;
        },
      ),
    );
  }

  Widget _botonContrasena(){
    return Container(
      padding: EdgeInsets.only(left:10),
      alignment: Alignment.center,
      color: Colors.black12,
      child: TextFormField(
        
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(LoginIcons.key),
          labelText: 'Password',
        ),
        obscureText: true,
        onSaved: (String value) {
          
        },
        validator: (String value) {
          if (value.isEmpty) 
            return 'Please, type something';
          return null;
        },
      )
    );
  }

  
  Widget _botonNext(){
    return Container(
      child: CupertinoButton(
        child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 25),),
        onPressed: (){
          if(!_formKey.currentState.validate())
            return null;
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Center(child: Text("Alright"),),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            )
          );
        },
        color: Color(0xff489ED2),
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    );
  }

  Widget _nuevoUsuarioOlvidoPass(){
    return Row(
        children: <Widget>[
          Expanded(
            child:  Container(
              child: FlatButton(
              child: Text("New user?",style: TextStyle(color: Colors.grey, fontSize: 16),),
              onPressed: (){},
            ),
            )
          ),
          Expanded(
            child:  Container(
              child: FlatButton(
                child: Text("Forgot password?",style: TextStyle(color: Colors.grey, fontSize: 16),),
                onPressed: (){print(MediaQuery.of(context).size.height);},
              ),
            ),
          ),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: _barraSuperior()
      ),
      body: _cuerpoDeLaVista(),
    );
  }
}