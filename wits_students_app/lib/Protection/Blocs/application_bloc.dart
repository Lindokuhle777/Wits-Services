import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wits_students_app/Protection/Services/geolocator_service.dart';
import 'package:wits_students_app/Protection/Services/places_service.dart';

import 'package:wits_students_app/Protection/Models/place_search.dart';
import 'package:wits_students_app/Protection/Models/place.dart';

class ApplicationBloc with ChangeNotifier{
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  //variables
  dynamic currentLocation;
  List<PlaceSearch> searchResult = [];
  StreamController<Place> selectedLocation = StreamController<Place>();

  ApplicationBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async{
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();

  }

  searchPlaces(String search) async{
    searchResult = await placesService.getAutoComplete(search);
    notifyListeners();
  }

  setSelectedLocation(String placeId) async{
    selectedLocation.add(await placesService.getPlace(placeId));
    searchResult = [];
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }

}