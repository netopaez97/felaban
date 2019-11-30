import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetWorkingFiltros extends StatefulWidget {
  @override
  _NetWorkingFiltrosState createState() => _NetWorkingFiltrosState();
}

class _NetWorkingFiltrosState extends State<NetWorkingFiltros> {

  bool _filtroAll = true;
  bool _filtroApproved = true;
  bool _filtroDeclined = true;
  bool _filtroPending = true;

    DateTime _time = DateTime.now();

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      backgroundColor: Colors.white,
      leading: CupertinoButton(
        child: Icon(Icons.close, color: Color(0xff333333),),
        padding: EdgeInsets.all(0),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      middle: Text("Filters", style: TextStyle(color: Color(0xff333333), fontSize: 16),),
      trailing: FlatButton(
        child: Text("Reset", style: TextStyle(color: Color(0xff333333), fontSize: 16),),
        onPressed: (){

        },
      )
    );
  }

  Widget _cuerpoDeLaPagina(){

    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          _meetingStatus(),
          SizedBox(height: 20,),
          _chooseDate(),
        ],
      ),
    );
  }

  Widget _meetingStatus(){
    return Material(
      elevation: 2,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text("Meeting Status:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          subtitle: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text("All", style: TextStyle(fontSize: 20,)),
                value: _filtroAll,
                onChanged: (val){
                  setState(() {
                    _filtroAll = !_filtroAll;
                    _filtroApproved = !_filtroApproved;
                    _filtroDeclined = !_filtroDeclined;
                    _filtroPending = !_filtroPending;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Approved", style: TextStyle(fontSize: 20,)),
                value: _filtroApproved,
                onChanged: (val){
                  setState(() {
                    _filtroApproved = !_filtroApproved;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Declined", style: TextStyle(fontSize: 20,)),
                value: _filtroDeclined,
                onChanged: (val){
                  setState(() {
                    _filtroDeclined = !_filtroDeclined;
                    if(_filtroDeclined == false){
                      if(_filtroApproved == true && _filtroPending == true){
                        _filtroAll = true;
                        _filtroDeclined = true;
                      }
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Pending", style: TextStyle(fontSize: 20,)),
                value: _filtroPending,
                onChanged: (val){
                  setState(() {
                    _filtroPending = !_filtroPending;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chooseDate(){

    return Material(
      elevation: 2,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text("By Date:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          subtitle: Container(
            padding: EdgeInsets.all(10),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text("From date", style: TextStyle(fontSize: 20)),
                    Text("To date", style: TextStyle(fontSize: 20)),
                  ]
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 80,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (newDate){

                        },
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide())
                        ),
                        child: Text(_time.toString()),
                      ),
                      onTap: () async {

                        DateTime _date = await showDatePicker(
                          context: context,
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now().add(Duration(seconds: 1)),
                          firstDate: DateTime.now(),
                        );

                        print(_date);

                        setState(() {
                          _time = DateTime(
                            _date.year,
                            _date.month,
                            _date.day,
                            _date.hour,
                            _date.minute
                          );
                        });
                        print(_time);
                      },
                    )
                  ]
                )
              ],
            ),
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpoDeLaPagina(),
    );
  }
}