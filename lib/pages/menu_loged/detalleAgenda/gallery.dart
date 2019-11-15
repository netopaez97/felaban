import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GalleryAgendaDetallesView extends StatelessWidget {

  final String _imageLocation;

  GalleryAgendaDetallesView(this._imageLocation, {Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: PhotoView(
        imageProvider: AssetImage(_imageLocation),
      )
    );
  }
}