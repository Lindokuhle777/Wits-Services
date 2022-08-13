import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:wits_students_app/Protection/Models/place_search.dart';
import 'package:wits_students_app/Protection/Models/place.dart';
class PlacesService {
  final key = 'AIzaSyC9IASWYn-Va2629LjojJW9EO_VcmWXp_Q';

  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=establishment&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    var results =
        jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
    print('blahblahblahblahblahblahblahblahblahblah${results}');
    return results;
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    var result = Place.fromJson(jsonResult);
    return result;
  }
}
