import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
   static const String route = "MapScreen";
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.698557, 85.365656);
  LatLng myLocation1 = const LatLng(27.706142, 85.330030);
  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId(myLocation.toString()),
        position: myLocation,
        infoWindow: const InfoWindow(
          title: 'SAAYA_Ecommerce',
          snippet: 'This is my home',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(myLocation1.toString()),
        position: myLocation1,
        infoWindow: const InfoWindow(
          title: 'SAAYA_Ecommerce',
          snippet: 'Visit us anytime Sun to Fri',
          
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAAYA_Ecommerce's Location Map",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 37, 158, 172),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Office Location",
                  style: TextStyle(
                    color:Color.fromARGB(255, 37, 158, 172),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: GoogleMap(
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: myLocation,
                  zoom: 10,
                ),
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: ((controller) => _mapController = controller),
              ),
            ),
            Text(
                  "Visit us any time",
                  style: TextStyle(
                    color:Color.fromARGB(255, 37, 158, 172),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
                Text('Contact Us: 9861688080')
          ],
        ),
      ),
    );
  }
}
