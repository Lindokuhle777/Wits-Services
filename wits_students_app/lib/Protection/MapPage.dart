import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:wits_students_app/Protection/Services/LocationService.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import 'Blocs/application_bloc.dart';
import 'Models/place.dart';

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

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      _goToPlace(place);
    });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  String dropdownvalue = 'Item 1';
  String dropdownvalue2 = 'Item 2';

  // List of items in our dropdown menu
  var items = [
    'Main Campus',
    'Education Campus',
    'Health Science Campus',
  ];

  var items2 = [
    'Campus Africa',
    'Gateway',
    'Student Digz',
    'J-One',
    'Mpumelelo',
    'Richmond',
    'South Point',
    'Quintal',
    'JORRISON 22',
  ];

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      // appBar: AppBar(),
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.grey[350],
              child: DrawerHeader(
                child: Center(
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                    ),
                    title: const Text('Amir Seilsepour'),
                    subtitle: const Text('Edit Profile'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/home/profile');
                    },
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
              title: const Text('Payment'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home/payment');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.discount_sharp,
                color: Colors.black,
              ),
              title: const Text('Promotions'),
              subtitle: const Text('Enter Promo Code'),
              onTap: () {},
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: const Size(70, 30),
                    maximumSize: const Size(70, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                child: const Text('NEW'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: const Text('My Rides'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.work,
                color: Colors.black,
              ),
              title: const Text('Work Rides'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.support,
                color: Colors.black,
              ),
              title: const Text('Support'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
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
                    // const Marker(
                    //   markerId: MarkerId('source'),
                    //   position: sourceLocation,
                    // ),
                    // const Marker(
                    //   markerId: MarkerId('destination'),
                    //   position: destinationLocation,
                    // ),
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
                            builder: (context) => ListView(
                                  children: [
                                    Container(
                                      // color: Colors.grey,
                                      // height: 500,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            trailing: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: const Text(
                                                'From:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              )),
                                          Container(
                                            height: 50,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      Colors.blue.shade100,
                                                  prefixIcon: const Icon(
                                                      Icons.my_location),
                                                  suffixIcon: Container(
                                                    margin: const EdgeInsets.only(right: 20),
                                                    child: DropdownButton(
                                                      icon: const Icon(Icons.keyboard_arrow_down),
                                                      items: items.map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          dropdownvalue = newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide.none,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15, top: 5),
                                              child: const Text(
                                                'To:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              )),
                                          Container(
                                            height: 50,
                                            margin: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      Colors.blue.shade100,
                                                  prefixIcon:
                                                      const Icon(Icons.search),
                                                  suffixIcon: Container(
                                                    margin: const EdgeInsets.only(right: 20),
                                                    child: DropdownButton(
                                                      icon: const Icon(Icons.keyboard_arrow_down),
                                                      items: items2.map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          dropdownvalue2 = newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide.none,
                                                  )),
                                              onChanged: (value) async {
                                                await applicationBloc
                                                    .searchPlaces(value);
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 200),
                                              child: FloatingActionButton(

                                                onPressed: (){},
                                                child: const Text(
                                                  'BOOK',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   color: Colors.grey[100],
                                    //   margin: const EdgeInsets.only(top: 20),
                                    //   // height: 300,
                                    //   child: ListView.builder(
                                    //     scrollDirection: Axis.vertical,
                                    //     shrinkWrap: true,
                                    //     itemCount:
                                    //         applicationBloc.searchResult.length,
                                    //     itemBuilder: (context, index) {
                                    //       return Column(
                                    //         children: [
                                    //           ListTile(
                                    //             title: Text(
                                    //               applicationBloc
                                    //                   .searchResult[index]
                                    //                   .description,
                                    //               style: const TextStyle(
                                    //                   color: Colors.black,
                                    //                   fontWeight:
                                    //                       FontWeight.bold),
                                    //             ),
                                    //             onTap: () {
                                    //               applicationBloc
                                    //                   .setSelectedLocation(
                                    //                       applicationBloc
                                    //                           .searchResult[index]
                                    //                           .placeId);
                                    //               Navigator.pop(context);
                                    //             },
                                    //           ),
                                    //           const Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 horizontal: 10.0),
                                    //             child: Divider(
                                    //               thickness: 1,
                                    //               color: Colors.black54,
                                    //             ),
                                    //           )
                                    //         ],
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ));
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
      // bottomSheet: BottomSheet(builder: (BuildContext context) {  },),
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
