// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../map_utils.dart';

class DirectionPage extends StatefulWidget {
   final Map<String, dynamic>? args;


  const DirectionPage(this.args,{Key? key}) : super(key: key);
  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  late CameraPosition _initialPosition;
  final Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  var endPosition =null;
  double startLatitude = 0.0;
  var startLongitude=null;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(28.01379,73.312653),
      zoom:14.0,
    );
     loadData(widget.args);
  }
loadData(arguments) async {
  print('loadData');
  var data ='${arguments['latitude']},${arguments['longitude']}';
  setState(() {
   endPosition = LatLng(arguments['latitude'], arguments['longitude']);
  });
 await getDriverCurrentLocation().then((value) async {
  setState(() {
      double startLatitude =value.latitude;
       print("current");
       print(startLatitude);
    });
    List<LatLng> latLen = [
    LatLng(value.latitude, value.longitude),
    LatLng(arguments['latitude'], arguments['longitude']),
    ];
       print('loadData222');

    // setState(() {
    //   startLatitude =value.latitude;
    //   startLongitude =value.longitude;
    // });
    
      
    
  });
}
Future<Position> getDriverCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error' + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 2);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline(endPointData) async {

      double lat1 = 28.010790;
      double lat2 = 73.321007;

      double lat3 = endPointData['latitude'];
      double lat4 = endPointData['longitude'];

      print("startLatitudeee");
      print(startLatitude);

     // double lat5 = startLatitude;
      //double lat6 = startLongitude;

     // LatLng otherLocation = LatLng(lat5,lat6); 


      LatLng startLocation = LatLng(lat1,lat2); 
      LatLng endLocation = LatLng(lat3, lat4); 

     

      

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyAkQS7iq1NgOM_r1c60jdzk8ekxGPvRcm4',
        PointLatLng(startLocation.latitude,startLocation.longitude), // start point
        PointLatLng(endLocation.latitude,endLocation.longitude), // end point
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    
    print('xxxxx');
     print(startLatitude);

    var endLatitude =widget.args!['latitude'];
    var endLongitude =widget.args!['longitude'];

    LatLng startLocation = LatLng(28.010790, 73.321007); 
    LatLng endLocation = LatLng(endLatitude, endLongitude);
   
    Set<Marker> _markers = {
      Marker(
          markerId: MarkerId('start'),
          position: LatLng(startLocation.latitude,startLocation.longitude)), // start point
      Marker(
          markerId: MarkerId('end'),
          position: LatLng(endLocation.latitude,endLocation.longitude)) // end point
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GoogleMap(
        polylines: Set<Polyline>.of(polylines.values),
        initialCameraPosition: _initialPosition,
        markers: Set.from(_markers),
        onMapCreated: (GoogleMapController controller) {
          Future.delayed(Duration(milliseconds: 2000), () {
            controller.animateCamera(
              CameraUpdate.newLatLngBounds(
                MapUtils.boundsFromLatLngList(
                      _markers.map((loc) => loc.position).toList()
                    ),
                50)
              );
            _getPolyline(widget.args);
          });
        },
      ),
    );
  }
}