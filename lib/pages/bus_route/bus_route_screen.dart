import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:bus_o_pedia/pages/bus_details/bus_info.dart';
import 'package:bus_o_pedia/models/model.dart';
import 'package:bus_o_pedia/logics/routes.dart';
import 'package:bus_o_pedia/logics/logic.dart';
import '../../themes/colors.dart';

class SearchRouteWidget extends StatefulWidget {
  @override
  _SearchRouteWidgetState createState() => _SearchRouteWidgetState();
}

class _SearchRouteWidgetState extends State<SearchRouteWidget> {
  late final List<BusRoute> busRoutes;
  final TextEditingController _busController = TextEditingController();
  final TextEditingController _busRouteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    busRoutes = funs().parseBusRoutes(Routes().routes1);
    busRoutes.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  void dispose() {
    _busController.dispose();
    _busRouteController.dispose();
    super.dispose();
  }

  List<BusRoute> getAllBusses(String query) {
    return busRoutes.where((bus) => bus.name.toLowerCase().startsWith(query.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Material(
            elevation: 8.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100, maxHeight: 280),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFf0f1f3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Search a Bus Route",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(height: 8),
                      TypeAheadField<BusRoute>(
                        builder: (context, controller, focusNode) {
                          return TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.directions_bus,size: 30,color: AppColors.appPrimary,),
                              labelText: 'Bus Name/No',
                              labelStyle: TextStyle(color: AppColors.lightPrimary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.appPrimary, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          );
                        },
                        hideKeyboardOnDrag: true,
                        controller: _busController,
                        suggestionsCallback: (pattern) => getAllBusses(pattern),
                        itemBuilder: (context, bus) {
                          return ListTile(
                            title: Text(bus.name),
                            subtitle: Text(bus.route),
                          );
                        },
                        onSelected: (bus) {
                          _busController.text = bus.name;
                          _busRouteController.text=bus.route;
                          ///TODO
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          BusRoute selectedBus = getBusByName(_busController.text,_busRouteController.text);
                          if (selectedBus.name.isNotEmpty) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusDetailsPage(bus: selectedBus)));
                          } else {
                            // TODO: Handle bus not found case
                          }
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
        ),
      ],
    );
  }

  BusRoute getBusByName(String busName, String busRoute) {
    return busRoutes.firstWhere(
          (bus) => bus.name.toLowerCase() == busName.toLowerCase() && bus.route.toLowerCase() == busRoute.toLowerCase(),
      orElse: () => funs().emptyBus,
    );
  }

}
