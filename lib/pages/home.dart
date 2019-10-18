import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  //MyHomePage({Key key, this.title}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AppBar _barraSuperior(){
    return AppBar();
  }

  Widget _cuerpoDeLaVista(){
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _stackSuperior(),
        _textoAccesoConHuellaDigitalOReconocimientoFacial(),
        _imagenAccesoConHuellaDigitalOReconocimientoFacial(),
        Container(height: MediaQuery.of(context).size.width*0.02),
        _botonCorreoElectronico(),
        _botonContrasena(),
        _botonNext(),
      ],
    );
  }

  Widget _stackSuperior(){
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.fitWidth,
              color: Colors.black54,
              colorBlendMode: BlendMode.colorDodge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.05),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Text(
              "Welcome to the FELABAN APP",
              style: TextStyle(color: Colors.white),
            )
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textoAccesoConHuellaDigitalOReconocimientoFacial(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*0.03), 
      height: MediaQuery.of(context).size.height*0.1,
      alignment: Alignment.center,
      child: Text(
        "Log in to access your networking profile and customize the app for your event experience",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _imagenAccesoConHuellaDigitalOReconocimientoFacial(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.face),
            onPressed: (){},
            iconSize: MediaQuery.of(context).size.width*0.18,
          ),
          IconButton(
            icon: Icon(Icons.fingerprint),
            onPressed: (){},
            iconSize: MediaQuery.of(context).size.width*0.18,
          ),
        ],
      ),
    );
  }

  Widget _botonCorreoElectronico(){
    return Container(
      height: MediaQuery.of(context).size.height*0.09,
      alignment: Alignment.center,
      color: Colors.black12,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.person_outline),
          hintText: 'Example: felaban@feleaban.com',
          labelText: 'Username (your email)',
        ),
        onSaved: (String value) {
          
        },
        validator: (String value) {
          if(value.isEmpty)
            return "Ingrese un valor";
          return null;
        },
      ),
    );
  }

  Widget _botonContrasena(){
    return Container(
      height: MediaQuery.of(context).size.height*0.09,
      alignment: Alignment.center,
      color: Colors.black12,
      child: TextFormField(
        
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.vpn_key),
          labelText: 'Password',
        ),
        obscureText: true,
        onSaved: (String value) {
          
        },
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Por favor, ingrese un email válido';
          }
          return null;
        },
      )
    );
  }

  Widget _usuarioContrasena(){
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*0.2,
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.02),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person_outline),
                  hintText: 'Example: felaban@feleaban.com',
                  labelText: 'Username (your email)',
                ),
                onSaved: (String value) {
                  
                },
                validator: (String value) {
                  if(value.isEmpty)
                    return "Ingrese un valor";
                  return null;
                },
              ),
            ),
            Container(
              color: Colors.black12,
              child: TextFormField(
                
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key),
                  labelText: 'Password',
                ),
                obscureText: true,
                onSaved: (String value) {
                  
                },
                validator: (String value) {
                  if (value.isEmpty ||
                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                    return 'Por favor, ingrese un email válido';
                  }
                  return null;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonNext(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      child: RaisedButton(
        child: Text("Next", style: TextStyle(color: Colors.white),),
        onPressed: (){

        },
        color: Colors.blue,
        elevation: 0,
      ),
    );
  }

  Widget _nuevoUsuarioOlvidoPass(){
    return Row(
      children: <Widget>[
      Expanded(
        child:  FlatButton(
          child: Text("New user?",style: TextStyle(color: Colors.grey),),
          onPressed: (){},
        ),
      ),
      Expanded(
        child:  FlatButton(
          child: Text("Forgot password?",style: TextStyle(color: Colors.grey),),
          onPressed: (){},
        ),
      ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpoDeLaVista(),
      bottomNavigationBar: _nuevoUsuarioOlvidoPass(),
    );
  }
}