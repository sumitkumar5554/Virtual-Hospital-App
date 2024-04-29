// import 'dart:async';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoogleMap extends StatefulWidget {
//   const GoogleMap({super.key, required bool myLocationEnabled, required Set<Marker> markers, required MapType mapType, required bool compassEnabled, required CameraPosition initialCameraPosition, required Null Function(GoogleMapController controller) onMapCreated});
//
//   @override
//   State<GoogleMap> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<GoogleMap> {
//   getCurrentLocation()async{
//     LocationPermission permission = await Geolocator.checkPermission();
//     if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
//       log("Location Denied");
//       LocationPermission ask = await Geolocator.requestPermission();
//     }
//     else{
//       Position currentposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//       log("Latitude = ${currentposition.latitude.toString()}");
//       log("Longitude = ${currentposition.longitude.toString()}");
//     }
//   }
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(23.18155,77.30165),
//     zoom: 14.4746,
//   );
//
//   List<Marker> _marker = [];
//   final List<Marker> _list = const [
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(23.156340, 77.419202),
//         infoWindow: InfoWindow(
//           title: 'My Current Location',
//         )),
//     Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(23.2015, 77.4149),
//         infoWindow: InfoWindow(
//           title: 'Chunabhatti Square',
//         )),
//     Marker(
//         markerId: MarkerId('3'),
//         position: LatLng(27.18155,73.30165),
//         infoWindow: InfoWindow(
//           title: 'M.P. Nagar',
//         )),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _marker.addAll(_list);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Nearest Hospital"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         markers: Set<Marker>.of(_marker),
//         myLocationEnabled: true,
//         mapType: MapType.hybrid,
//         compassEnabled: false,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
// }