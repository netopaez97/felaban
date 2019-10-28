import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget barraSuperior(BuildContext context){
  return CupertinoNavigationBar(
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
    );
}