import 'package:wits_students_app/Protection/Models/location.dart';

class Geometry{
  late final Location location;

  Geometry({required this.location});

  factory Geometry.fromJson(Map<dynamic, dynamic> parsedJson){
    return Geometry(location: Location.fromJson(parsedJson['location']));
  }
}