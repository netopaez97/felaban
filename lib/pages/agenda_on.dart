import 'package:felaban/components/app_drawer_loged.dart';
import 'package:flutter/material.dart';

class AgendaOnView extends StatelessWidget {

  final String title;
  AgendaOnView(this.title, {Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(title),
      body: Center(
        child: Text(title,),
      ),
    );
  }
}