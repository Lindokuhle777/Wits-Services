import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:wits_students_app/Protection/MapStuff/MyBottomSheet.dart';
import 'package:wits_students_app/Protection/Services/LocationService.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../Blocs/application_bloc.dart';
import '../Models/place.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final Completer<GoogleMapController> _mapController = Completer();
  final ScrollController listViewController = ScrollController();
  late StreamSubscription locationSubscription;

  // @override
  // void initState() {
  //   final applicationBloc =
  //       Provider.of<ApplicationBloc>(context, listen: false);
  //
  //   locationSubscription =
  //       applicationBloc.selectedLocation.stream.listen((place) {
  //     _goToPlace(place);
  //   });
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   final applicationBloc =
  //       Provider.of<ApplicationBloc>(context, listen: false);
  //   applicationBloc.dispose();
  //   locationSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      key: _key,
      drawer: const Drawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _key.currentState!.openDrawer();
        },
        mini: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        child: const Icon(Icons.menu),
      ),
      body: (applicationBloc.currentLocation == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(applicationBloc.currentLocation.latitude,
                          applicationBloc.currentLocation.longitude),
                      zoom: 17),
                  // polylines: {
                  //   Polyline(
                  //     polylineId: const PolylineId('route'),
                  //     points: polyLineCoordinates,
                  //     color: Colors.blue,
                  //     width: 6,
                  //   ),
                  // },
                  markers: {
                    Marker(
                      markerId: const MarkerId('currentLocation'),
                      // icon: sourceIcon,
                      position: LatLng(applicationBloc.currentLocation.latitude,
                          applicationBloc.currentLocation.longitude),
                    ),
                  },
                  onMapCreated: (mapController) {
                    _mapController.complete(mapController);
                  },
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  tiltGesturesEnabled: true,
                  // onCameraMove:(CameraPosition cameraPosition){
                  //   zoomLevel = cameraPosition.zoom;
                  //   // print(cameraPosition.zoom);
                  // },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    height: 40,
                    width: 80,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            // isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            )),
                            context: context,
                            builder: (context) => MyBottomSheet(applicationBloc));
                      },
                      child: const Text(
                        'BOOK',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(place.geometry.location.lat, place.geometry.location.lng),
          zoom: 17)),
    );
  }
}
