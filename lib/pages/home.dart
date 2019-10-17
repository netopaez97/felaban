import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  //MyHomePage({Key key, this.title}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AppBar _barraSuperior(){
    return AppBar();
  }

  Widget _cuerpoDeLaVista(){
    return ListView(
        children: <Widget>[
          _stackSuperior(),
          _accesoConHuellaDigitalOReconocimientoFacial(),
          _usuarioContrasena(),
          _botonNext(),
          _nuevoUsuarioOlvidoPass(),
        ],
    );
  }

  Widget _stackSuperior(){
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      child: Stack(
        children: <Widget>[
          Image.asset("assets/logo.JPG")
        ],
      ),
    );
  }

  Widget _accesoConHuellaDigitalOReconocimientoFacial(){
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03), 
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text("Log in to access your networking profile and customize the app for your event experience"),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.face),
                  onPressed: (){},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.fingerprint),
                  onPressed: (){},
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _usuarioContrasena(){
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
      child: Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.supervised_user_circle),
              hintText: 'Ejemplo: felaban@feleaban.com',
              labelText: 'Correo electrónico',
            ),
            onSaved: (String value) {
              
            },
            validator: (String value) {
              if(value.isEmpty)
                return "Ingrese un valor";
              return null;
            },
          ),
          TextFormField(
            
            decoration: const InputDecoration(
              icon: Icon(Icons.vpn_key),
              labelText: 'Contraseña',
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
        ],
      ),
    ),
    );
  }

  Widget _botonNext(){
    return Container(
      child: RaisedButton(
        child: Text("Next", style: TextStyle(color: Colors.white),),
        onPressed: (){

        },
        color: Colors.blue,
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
    );
  }
}