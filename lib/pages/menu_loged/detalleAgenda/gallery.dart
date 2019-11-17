import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GalleryAgendaDetallesView extends StatelessWidget {

  final String _imageLocation;

  GalleryAgendaDetallesView(this._imageLocation, {Key key}) : super(key:key);

  CupertinoNavigationBar _barraSuperior( BuildContext context ){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      actionsForegroundColor: Colors.white,
      leading: CupertinoNavigationBarBackButton(
        previousPageTitle: "Back",
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      middle: Text("Gallery", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,)),
      padding: EdgeInsetsDirectional.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barraSuperior(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
          imageProvider: AssetImage(_imageLocation),
        ),
      )
    );
  }
}