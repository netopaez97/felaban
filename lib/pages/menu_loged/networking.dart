import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class NetworkingArea extends StatefulWidget {

  static const routeName = "/networking";

  @override
  _NetworkingAreaState createState() => _NetworkingAreaState();
}

class _NetworkingAreaState extends State<NetworkingArea> {

  

  double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraAttendees(),
        _whatYouAreOffering(),
        _lookingFor(),
      ],
    );
  }

  Widget _barraAttendees(){
    return Container(
      color: Color(0xff489ED2),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Networking Area", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          Image.asset("assets/drawerImages/deal.png", color: Colors.white,),
        ],
      ),
    );
  }

  Widget _whatYouAreOffering(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        trailing: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        title: Row(
          children: <Widget>[
            Text("Tell others what you’re ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("offering", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(_margenHorizontal),
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Our algorith uses your interests to match you with the right people", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 18),),
                _softwareDevelopment(),
                _marketingYBigData(),
                _productDesign(),
                _bankingAndSecurity(),
                _artificialIntelligenceAndOther(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _softwareDevelopment(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.only(top: _margenHorizontal, bottom: 5),
        child: Text("Software Develoment", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _marketingYBigData(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Marketing", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Big Data", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }

  Widget _productDesign(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text("Product Design", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _bankingAndSecurity(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Online Banking", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Security", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }

  Widget _artificialIntelligenceAndOther(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
            child: Text("Artificial Inteligence", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF6F6F6)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
            child: Text("Other", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }


  Widget _lookingFor(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        trailing: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        title: Row(
          children: <Widget>[
            Text("Tell us what you’re ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("Looking for?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(_margenHorizontal),
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _softwareDevelopment(),
                _marketingYBigData(),
                _productDesign(),
                _bankingAndSecurity(),
                _artificialIntelligenceAndOther(),
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}


class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}