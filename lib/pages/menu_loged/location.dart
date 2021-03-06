import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {

  static const String routeName = "/location";

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  final double _margenHorizontal = 15;
  final Set<Marker> _markers = Set();


  GoogleMapController mapController;

  final LatLng _center = const LatLng(25.991922, -80.118406);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _barraVenue(),
        _presentacionVenue(),
        _imagenUbicacion(),
        _descripcionDeUbicacion(),
        _barraAboutLocation(),
        _descripcionDeUbicacion2(),
        _barraMap(),
        SizedBox(height: 5,),
        _mostrarMapa(),
      ],
    );
  }

  Widget _barraVenue(){
    return Container(
      height: 53,
      alignment: Alignment.center,
      color: Color(0xff489ED2),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Venue", style: TextStyle(color: Colors.white, fontSize: 20),),
          Container(
            width: 35,
            child: Image.asset("assets/drawerImages/venue.png", color: Colors.white, fit: BoxFit.contain,),
          ),
        ],
      )
    );
  }

  Widget _presentacionVenue(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      padding: EdgeInsets.all(_margenHorizontal),
      color: Color(0xffF0F0F0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("The Diplomat Beach Resort", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Text("3555 South Ocean Drive, Hollywood, Florida, 33019, USA", style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

  Widget _imagenUbicacion(){
    return Image.asset("assets/location/ubicacionFoto.png");
  }

  Widget _descripcionDeUbicacion(){
    return Padding(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text("On one of the most remarkable stretches of sand and sea in South Florida, The Diplomat Beach Resort is ideally situated between Miami and Fort Lauderdale along Hollywood’s Gold Coast. Our sun-splashed and spacious rooms and suites feature stunning views of the Atlantic Ocean or Intracoastal Waterway and thoughtful touches like vintage-inspired art, luxurious amenities and plush bedding.", style: TextStyle(fontSize: 16)),
    );
  }

  Widget _barraAboutLocation(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      color: Color(0xffF0F0F0),
      child: Text("About the Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget _descripcionDeUbicacion2(){
    return Padding(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text("Enjoy shopping near Mission Valley at San Diego’s premier outdoor shopping and entertainment destination – the Fashion Valley shopping district is an upscale, open‐air shopping destination with 200 places to dine and shop, and an 18 screen movie theater – within easy walking distance from our hotel by the footbridge or Fashion Valley Road.", style: TextStyle(fontSize: 16)),
    );
  }

  Widget _barraMap(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      color: Color(0xffF0F0F0),
      child: Text("Map", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }

  Widget _mostrarMapa(){
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            child: _mapa(),
          ),
          Container(
            height: 300,
            color: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: barraSuperior(context),
            body: _mapa(),
          )
        ));
      },
    );
  }

  Widget _mapa(){
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      markers: _markers,
    );
  }

  @override
  void initState() {
    super.initState();
    _markers.add(
        Marker(
            markerId: MarkerId('newyork'),
            position: LatLng(25.991922, -80.118406),
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