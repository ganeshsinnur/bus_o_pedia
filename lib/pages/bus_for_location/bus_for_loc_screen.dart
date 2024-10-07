import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../logics/logic.dart';
import '../../models/model.dart';
import '../../logics/routes.dart';
import '../../themes/colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/bottom_sheet.dart';

class BusForLocationPage extends StatefulWidget {
  const BusForLocationPage({super.key});

  @override
  State<BusForLocationPage> createState() => _BusForLocationPageState();
}

class _BusForLocationPageState extends State<BusForLocationPage> {


  late final List<BusRoute> busRoutes;
  late final List<String> city;

  @override
  void initState() {

    busRoutes=funs().parseBusRoutes(Routes().routes1);
    city=(funs().getAllUniqueStops(busRoutes));
    super.initState();
  }

  final TextEditingController _locController = TextEditingController();
  List<String> getCity(String query){
    return city.where((city)=> city.toLowerCase().contains(query.toLowerCase())).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Material(
            elevation: 8.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 280,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf0f1f3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Search Buses for a location",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black87
                          ),),
                      ),
                      const SizedBox(height: 8,),
                      TypeAheadField(
                        builder:  (context, controller, focusNode) {
                          return TextField(
                            style: TextStyle(color: Colors.black),
                            controller: controller,
                            focusNode: focusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(FontAwesomeIcons.locationDot,color: AppColors.appPrimary,),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 24,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              labelText: 'Location',
                              labelStyle: TextStyle(
                                color: AppColors.lightPrimary,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.appPrimary, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  )),
                              border: const OutlineInputBorder(),
                            ),
                          );
                        },
                        hideKeyboardOnDrag: true,
                        controller: _locController,
                        suggestionsCallback: (pattern) => getCity(pattern),
                        itemBuilder: (context, city) {
                          return ListTile(
                            title: Text(city),
                          );
                        },
                        onSelected: (city) {
                          _locController.text=city;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          showBusBottomSheet(context,_findBusesByQuery(_locController.text,busRoutes));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff072e41),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            'Search Bus Route',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _locController.dispose();
    super.dispose();
  }
}

List<BusRoute> _findBusesByQuery(String query, List<BusRoute> busRoutes) {
  // Normalize the query for case-insensitive comparison
  String normalizedQuery = query.toLowerCase();

  // Filter the bus routes based on the query
  return busRoutes.where((route) {
    // Check if the route's stops contain the query
    return route.stops.any((stop) => stop.toLowerCase().contains(normalizedQuery));
  }).toList();
}


void showBusBottomSheet(BuildContext context, List<BusRoute> busList) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
    ),
    builder: (context) {
      return BusBottomSheet(busList: busList,);
    },
  );
}