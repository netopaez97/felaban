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

  DateTime _initTime;
  DateTime _endTime;

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
          SizedBox(height: 20,),
          Column(
            children: <Widget>[
              CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Color(0xffFF595F),
                child: Text("Apply Filters", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,)),
                onPressed: (){
                  if(_initTime==null || _endTime == null){
                    return showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return CupertinoAlertDialog(
                          title: Text("Please, choose dates."),
                          actions: <Widget>[
                            CupertinoButton(
                              borderRadius: BorderRadius.zero,
                              padding: EdgeInsets.all(0),
                              child: Text("Ok"),
                              color: Color(0xff29983A),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      }
                    );
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
                    if(_filtroAll == true){
                      _filtroAll = false;
                      _filtroApproved = false;
                      _filtroDeclined = false;
                      _filtroPending = false;
                    }
                    else{
                      _filtroAll = true;
                      _filtroApproved = true;
                      _filtroDeclined = true;
                      _filtroPending = true;
                    }
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
                    else{
                      
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
              columnWidths: {1:FractionColumnWidth(.1)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Text("From date", style: TextStyle(fontSize: 20)),
                    SizedBox(),
                    Text("To date", style: TextStyle(fontSize: 20)),
                  ]
                ),
                TableRow(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now().add(Duration(seconds: 1)),
                          firstDate: DateTime.now(),
                        ).then(
                          (newDate){
                            setState(() {
                            _initTime = DateTime(
                                newDate.year,
                                newDate.month,
                                newDate.day,
                                newDate.hour,
                                newDate.minute
                              );
                            });
                            _endTime = null;
                          }
                        ).catchError(
                          (e){
                            print(e);
                          }
                        );
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Color(0xff999999)))
                        ),
                        child: _initTime == null
                        ? Text("MM/dd/yyyy", style: TextStyle(fontSize: 16, color: Color(0xff999999)),)
                        : Text("${_initTime.month.toString()}-${_initTime.day.toString()}-${_initTime.year.toString()}", style: TextStyle(fontSize: 16, color: Color(0xff999999)),),
                      ),
                    ),
                    SizedBox(),
                    GestureDetector(
                      child: Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Color(0xff999999)))
                        ),
                        child: _endTime == null
                        ? Text("MM/dd/yyyy", style: TextStyle(fontSize: 16, color: Color(0xff999999)),)
                        : Text("${_endTime.month.toString()}-${_endTime.day.toString()}-${_endTime.year.toString()}", style: TextStyle(fontSize: 16, color: Color(0xff999999)),),
                      ),
                      onTap: () async {

                        if(_initTime != null){
                          await showDatePicker(
                            context: context,
                            lastDate: DateTime(2100),
                            initialDate: _initTime.add(Duration(seconds: 1)),
                            firstDate: _initTime,
                          ).then(
                            (newDate){
                              setState(() {
                              _endTime = DateTime(
                                  newDate.year,
                                  newDate.month,
                                  newDate.day,
                                );
                              });
                            }
                          ).catchError(
                            (e){
                              print(e);
                            }
                          );
                        }

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

  Future _dialogDateTimePicker(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Container(
            width: double.infinity,
            height: 200,
            child: CupertinoDatePicker(
              minimumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _initTime,
              onDateTimeChanged: (newDate){
                setState(() {
                  _initTime = newDate;
                });
              },
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Text("OK"),
              color: Color(0xff29983A),
              borderRadius: BorderRadius.zero,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
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