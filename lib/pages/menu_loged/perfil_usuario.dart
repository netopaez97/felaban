import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUserView extends StatefulWidget {

  static const String routeName = "/perfilUsuario";

  @override
  _ProfileUserViewState createState() => _ProfileUserViewState();
}

class _ProfileUserViewState extends State<ProfileUserView> {

  bool profileState = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int detalles = 0;
  double _margenesDeTextos = 5;

  Widget _personalInformation(){
    return Column(
      children: <Widget>[
        Divider(color: Color(0xffC4C4C4), height: 1,),
        Container(
          height: 60,
          color: Color(0xFFF0F0F0),
          alignment: Alignment.center,
          child: Text("Personal Information", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
        ),
        Divider(color: Color(0xffC4C4C4), height: 1,),
        SizedBox(height: 41,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("First Name", style: TextStyle(fontSize: 16),), Text(" *", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                validator: (String value){
                  if(value.isEmpty)
                    return "We need your name";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Last Name", style: TextStyle(fontSize: 16),), Text(" *", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                validator: (String value){
                  if(value.isEmpty)
                    return "We need your last name";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Email", style: TextStyle(fontSize: 16),), Text(" *", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                    return "Type a valid email";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Password", style: TextStyle(fontSize: 16),), Text("*", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                obscureText: true,
                validator: (String value){
                  if(value.isEmpty)
                    return "Password is required";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("Mobile Phone Number", style: TextStyle(fontSize: 16),), Text("*", style: TextStyle(color: Colors.red),)],),
              ),TextFormField(
                keyboardType: TextInputType.phone,
                validator: (String value){
                  if(value.length != 10 || !RegExp(r'^[0-9]*$').hasMatch(value))
                    return "Type a valid phone number";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              SizedBox(
                height: 46,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _bussinessInformation(){
    return Column(
      children: <Widget>[
        Divider(color: Color(0xffC4C4C4), height: 1,),
        Container(
          height: 60,
          color: Color(0xFFF0F0F0),
          alignment: Alignment.center,
          child: Text("Bussiness Information", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
        ),
        Divider(color: Color(0xffC4C4C4), height: 1,),
        SizedBox(height: 41,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Company Name", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Job Title", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Brief Bio", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Work Phone", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("City", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("Country", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child:Row(children: <Widget>[Text("Website", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                validator: (String value){
                  if(value.isNotEmpty)
                    if(!RegExp(r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9]+(-?[a-zA-Z0-9])*\.)+[\w]{2,}(\/\S*)?$').hasMatch(value))
                      return "Type a valid website: www.something.aa";
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffC4C4C4))
                    )
                ),
                onSaved: (value){

                },
              ),
              SizedBox(
                height: 46,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _socialMedia(){
    return Column(
      children: <Widget>[
        Divider(color: Color(0xffC4C4C4), height: 1,),
        Container(
          height: 60,
          color: Color(0xFFF0F0F0),
          alignment: Alignment.center,
          child: Text("Social Media", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
        ),
        Divider(color: Color(0xffC4C4C4), height: 1,),
        SizedBox(height: 41,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("Instagram", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],)
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  ),
                  labelText: "  @",
                  labelStyle: TextStyle(color: Color(0xff8C8C8C), )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("Twitter", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  ),
                  labelText: "  @",
                  labelStyle: TextStyle(color: Color(0xff8C8C8C), )
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("LinkedIn URL", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                validator: (String value){
                  if(value.isNotEmpty)
                    if(!RegExp(r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9]+(-?[a-zA-Z0-9])*\.)+[\w]{2,}(\/\S*)?$').hasMatch(value))
                      return "Type a valid linkedIn url: www.something.aa";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  ),
                  labelText: "https://",
                  labelStyle: TextStyle(color: Color(0xff8C8C8C))
                ),
                onSaved: (value){

                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _margenesDeTextos),
                child: Row(children: <Widget>[Text("Facebook URL", style: TextStyle(fontSize: 16),), Text("", style: TextStyle(color: Colors.red),)],),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                validator: (String value){
                  if(value.isNotEmpty)
                    if(!RegExp(r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9]+(-?[a-zA-Z0-9])*\.)+[\w]{2,}(\/\S*)?$').hasMatch(value))
                      return "Type a valid facebook url: www.something.aa";
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffC4C4C4))
                  ),
                  labelText: "https://",
                  labelStyle: TextStyle(color: Color(0xff8C8C8C))
                ),
                onSaved: (value){

                },
              ),
            ],
          ),
        )
      ],
    );
  }

  

  Widget _botonSubmit(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: CupertinoButton(
            child: Text("UPDATE", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            onPressed: (){
              if(!_formKey.currentState.validate()){
                return "Verifique los campos";
              }
              _dialogoDeEnvio();
              return null;
            },
            color: Color(0xff489ED2),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ]
    );
  }
  Future _dialogoDeEnvio(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          content: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Your profile has been updated.", style: TextStyle(fontSize: 25, color: Color(0xff8C8C8C)),),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: CupertinoButton(
                    child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: Color(0xff29983A),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    final double _sizeImage = MediaQuery.of(context).size.height*0.17;

    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height*0.1,
                    width: double.infinity,
                    child: Image.asset("assets/background.png", fit: BoxFit.cover,)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Color(0xff489ED2)
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  print("Has oprimido la imagen del señor");
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.2,
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: _sizeImage,
                    height: _sizeImage,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                          "assets/images/profile_face.png",
                        )
                      ),
                      border: Border.all(color: Colors.white)
                    ),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height*0.3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("Giorgio Trettenero Castro", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("Secretario General FELABAN", style: TextStyle(fontSize: 16, color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("Privacy Settings", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*0.05),
                  child: Text("Private profiles require a contact share approval before they can be seen. Public profiles are visible to anyone on the attendee list.", style: TextStyle(), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Private     ", style: TextStyle(fontSize: 16),),
              CupertinoSwitch(
                value: profileState,
                onChanged: (val){
                  setState(() {
                    _formKey.currentState.validate();
                    profileState = !profileState; 
                  });
                },
                activeColor: Colors.green,
              ),
              Text("     Public", style: TextStyle(fontSize: 16),)
            ],
          ),
          SizedBox(height: 33,),/* 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  if(detalles>0){
                    setState(() {
                      detalles--; 
                    });
                  }
                },
              ),
              Text("Ver detalles"),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: (){
                  if(detalles<2){
                    setState(() {
                      detalles++; 
                    });
                  }
                },
              ),
            ],
          ), */
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _personalInformation(),
                _bussinessInformation(),
                _socialMedia(),
                _botonSubmit(),
              ],
            )
          ),
        ],
      ),
    );
  }
}