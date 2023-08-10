import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyMap extends StatefulWidget {
  const PropertyMap({Key? key}) : super(key: key);
   static const String route = "MapScreen";
  @override
  State<PropertyMap> createState() => _PropertyMapState();
}

class _PropertyMapState extends State<PropertyMap> {
  GoogleMapController? _mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.706142, 85.330030);
  @override
  void initState() {

    markers.add(
      Marker(
        markerId: MarkerId(myLocation.toString()),
        position: myLocation,
        infoWindow: const InfoWindow(
          title: 'Baneshwor',
          snippet: 'kfc',
          
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
        title: const Text("Property Location Map",
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
                  "Property Location",
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
                  zoom: 50,
                ),
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: ((controller) => _mapController = controller),
              ),
            ),
            SizedBox(height: 15,),
            Text(
                  "Visit us any time",
                  style: TextStyle(
                    color:Color.fromARGB(255, 37, 158, 172),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
                Text('Contact Us: 9861688080',style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
