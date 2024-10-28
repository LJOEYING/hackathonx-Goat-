// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GreenMapPage extends StatefulWidget {
//   @override
//   _GreenMapPageState createState() => _GreenMapPageState();
// }

// class _GreenMapPageState extends State<GreenMapPage> {
//   GoogleMapController? mapController;

//   final LatLng _center = const LatLng(3.0105, 101.6185);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 12.0,
//             ),
//           ),
//           Positioned(
//             top: 50,
//             left: 16,
//             right: 16,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.search, color: Colors.black),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Recycle Collection Point',
//                         hintStyle: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 80,
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Icon(Icons.home, color: Colors.black),
//                   Icon(Icons.location_pin, color: Colors.black),
//                   Icon(Icons.shopping_cart, color: Colors.black),
//                   Icon(Icons.person, color: Colors.black),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
