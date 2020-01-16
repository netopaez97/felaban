
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_extend/share_extend.dart';

class GalleryAgendaDetallesView extends StatefulWidget {

  final String _imageLocation;

  GalleryAgendaDetallesView(this._imageLocation, {Key key}) : super(key:key);

  @override
  _GalleryAgendaDetallesViewState createState() => _GalleryAgendaDetallesViewState();
}

class _GalleryAgendaDetallesViewState extends State<GalleryAgendaDetallesView> {

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
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.share),
        onPressed: () async {
          final ByteData bytes1 = await rootBundle.load(widget._imageLocation);

          await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("To share the specific image. We need them stored in the database."),
              content: Text("For now, we will share the image that you want."),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                )
              ],
            )
          );

          File file = await ImagePicker.pickImage(source: ImageSource.gallery);
          
          if(file != null)
            ShareExtend.share(file.path, "file");

          
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
          imageProvider: AssetImage(widget._imageLocation),
        ),
      )
    );
  }
}