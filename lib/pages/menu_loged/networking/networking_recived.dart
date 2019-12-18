import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/components/barra_networking.dart';
import 'package:felaban/pages/menu_loged/networking/filtros.dart';
import 'package:felaban/pages/menu_loged/networking/meeting_request_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkingRecived extends StatefulWidget {

  static const routeName = "/networkingRecived";
  final List requestRecived;
  NetworkingRecived(this.requestRecived,{Key key}) : super(key:key);

  @override
  _NetworkingRecivedState createState() => _NetworkingRecivedState();
}

class _NetworkingRecivedState extends State<NetworkingRecived> {

  double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        barraNetworking(_margenHorizontal),
        _searchAndFilters(),
        _barraMeetingRequest(),
        _presentacionInvitaciones(),
        _actividadesRecived(),
        Divider(color: Color(0xffC4C4C4), height: 0,),
      ],
    );
  }

  Widget _searchAndFilters(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _searchNavigation(),
          ),
          SizedBox(width: 10,),
          Text("Filters", style: TextStyle(fontSize: 18),),
          IconButton(
            icon: Icon(IconData(0xF39D, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), size: 34, color: Color(0xffA1A1A1),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => NetWorkingFiltros()
              ));
            },
          )
        ],
      ),
    );
  }

  Widget _searchNavigation(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xffE9E6E6),
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Search...",
          labelStyle: TextStyle(fontSize: 20),
          icon: Icon(Icons.search),
        ),
        onChanged: (input){
          
        },
      ),
    );
  }

  Widget _barraMeetingRequest(){

    return Container(
      alignment: Alignment.center,
      height: 70,
      color: Color(0xffF0F0F0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Text("Meeting Requests ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("Received", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          width: 33,
          alignment: Alignment.center,
          child: Text(widget.requestRecived.length.toString(), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

  Widget _presentacionInvitaciones(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text("You have received the following invitations:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16)),
    );
  }

  Widget _actividadesRecived(){
    return Column(
      children: widget.requestRecived.map(
        (solicitud) => Column(
          children: <Widget>[
            Divider(color: Color(0xffC4C4C4), height: 0,),
            Container(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(solicitud["de"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text(solicitud["empresa"], style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      solicitud["estado"] == "espera"
                      ? Container(
                        margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        child: CupertinoButton(
                          child: Text("View Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          color: Color(0xffC4C4C4),
                          padding: EdgeInsets.all(0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => RequestEditDetailsPage()
                            ));
                          },
                        ),
                      )
                      : Container(
                        margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        child: CupertinoButton(
                          child: Text("Confirmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          color: Color(0xff60B842),
                          padding: EdgeInsets.all(0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => RequestEditDetailsPage()
                            ));
                          },
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(solicitud["fecha"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)))
                      ),
                      Text(solicitud["hora"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)), textAlign: TextAlign.center,),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(solicitud["lugar"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C))),
                      ),
                      Text(solicitud["duracion"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)), textAlign: TextAlign.center,),
                    ]
                  ),
                ],
              ),
            ),
          ],
        )
      ).toList()
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