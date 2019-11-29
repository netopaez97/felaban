import 'package:flutter/material.dart';

Widget barraNetworking(double margenHorizontal){
    return Container(
      color: Color(0xff489ED2),
      padding: EdgeInsets.symmetric(horizontal: margenHorizontal),
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