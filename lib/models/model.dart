import 'dart:convert';  // To use jsonEncode

class BusRoute {
  String name;
  String route;
  String status;
  String imageUrl;
  List<String> stops;

  BusRoute({required this.name, required this.route, required this.status, required this.imageUrl, required this.stops});

  // Convert the object into a JSON-like map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'route': route,
      'status': status,
      'imageUrl': imageUrl,
      'stops': stops
    };
  }

  // Create a new instance from a JSON map
  factory BusRoute.fromJson(Map<String, dynamic> json) {
    return BusRoute(
      name: json['name'],
      route: json['route'],
      status: json['status'],
      imageUrl: json['imageUrl'],
      stops: List<String>.from(json['stops']),
    );
  }
}
