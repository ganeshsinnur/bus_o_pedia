import 'dart:developer';

import 'package:bus_o_pedia/logics/APIs.dart';
import 'package:bus_o_pedia/logics/logic.dart';
import 'package:bus_o_pedia/logics/routes.dart';
import 'package:bus_o_pedia/pages/homepage/homepage.dart';
import 'package:bus_o_pedia/themes/colors.dart';
import 'package:bus_o_pedia/utils/assets_path.dart';
import 'package:bus_o_pedia/widgets/double_bus_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../models/model.dart';
import '../../widgets/bottom_sheet.dart';

class SourceToDestinationPage extends StatefulWidget {
  const SourceToDestinationPage({super.key});

  @override
  _SourceToDestinationPageState createState() =>
      _SourceToDestinationPageState();
}

class _SourceToDestinationPageState extends State<SourceToDestinationPage> {
  late final List<BusRoute> busRoutes;
  late final List<String> city;

  final TextEditingController _toController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _stopController = TextEditingController();
  bool _addstop = false;

  @override
  void initState() {
    super.initState();
    busRoutes = funs().parseBusRoutes(Routes().routes1);
    city = funs().getAllUniqueStops(busRoutes);
  }

  @override
  void dispose() {
    _toController.dispose();
    _fromController.dispose();
    _stopController.dispose();
    super.dispose();
  }

  List<String> getCity(String query) {
    return city
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

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
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 350,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf0f1f3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Search Route by Source and Destination",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TypeAheadField(
                        builder: (context, controller, focusNode) {
                          return TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12),
                                child: Icon(Icons.my_location_sharp,
                                    color: AppColors.appPrimary),
                              ),
                              labelText: 'From Location',
                              labelStyle:
                                  TextStyle(color: AppColors.appPrimary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.appPrimary, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          );
                        },
                        hideKeyboardOnDrag: true,
                        controller: _fromController,
                        suggestionsCallback: (pattern) => getCity(pattern),
                        itemBuilder: (context, city) {
                          return ListTile(title: Text(city));
                        },
                        onSelected: (city) {
                          _fromController.text = city;
                        },
                      ),

                      !_addstop
                          ? Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              // Distribute space between the widgets
                              children: [
                                // Empty container to maintain equal spacing on both sides
                                Expanded(
                                  child: Container(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    String temp = _fromController.text;
                                    _fromController.text = _toController.text;
                                    _toController.text = temp;
                                  },
                                  icon:  Icon(
                                    Icons.swap_vert_rounded,
                                    size: 30,
                                    color: AppColors.appPrimary,
                                  ),
                                  splashColor: Colors.transparent,
                                ),
                                Expanded(
                                  child:
                                      Container(), // Empty container for spacing
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _addstop = true;
                                        });
                                      },
                                      child: Text("Add Stop",style: TextStyle(color:AppColors.appPrimary),)),
                                ),
                              ],
                            )
                          : Column(
                            children: [
                              const SizedBox(height: 10),
                              TypeAheadField(
                                  builder: (context, controller, focusNode) {
                                    return TextField(
                                      style: const TextStyle(color: Colors.black),
                                      controller: controller,
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Icon(Icons.add_rounded,
                                              color: AppColors.appPrimary),
                                        ),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                _addstop=false;
                                              });
                                            },
                                            child: Icon(Icons.cancel,
                                                color: AppColors.appPrimary),
                                          ),
                                        ),
                                        labelText: 'Add Stop',
                                        labelStyle: TextStyle(
                                            color: AppColors.appPrimary),

                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.appPrimary, width: 2.0),
                                        ),
                                        border: const OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                  hideKeyboardOnDrag: true,
                                  controller: _stopController,
                                  suggestionsCallback: (pattern) =>
                                      getCity(pattern),
                                  itemBuilder: (context, city) {
                                    return ListTile(title: Text(city));
                                  },
                                  onSelected: (city) {
                                    _stopController.text = city;
                                  },
                                ),
                              const SizedBox(height: 10),
                            ],
                          ),

                      TypeAheadField(
                        builder: (context, controller, focusNode) {
                          return TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12),
                                child: Icon(Icons.location_on,
                                    color: AppColors.lightPrimary),
                              ),
                              labelText: 'To Location',
                              labelStyle:
                                  TextStyle(color: AppColors.lightPrimary),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.appPrimary, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          );
                        },
                        hideKeyboardOnDrag: true,
                        controller: _toController,
                        suggestionsCallback: (pattern) => getCity(pattern),
                        itemBuilder: (context, city) {
                          return ListTile(title: Text(city));
                        },
                        onSelected: (city) {
                          _toController.text = city;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if(!_addstop){
                            var busList = funs().searchBusRoutes(busRoutes,
                                _fromController.text, _toController.text);
                            log("${_fromController.text} \n${_stopController.text} \n${_toController.text} \n");
                            showBusBottomSheet(context, busList);
                          }else{
                            var busList1=funs().searchBusRoutes(busRoutes, _fromController.text, _stopController.text);
                            var busList2=funs().searchBusRoutes(busRoutes, _stopController.text, _toController.text);
                            log("busList1-> ${busList1.length}");
                            log("busList2-> ${busList2.length}");
                            _showBusBottomSheet(context,busList1,busList2);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff072e41),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            'Search Route',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white),
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
}
void _showBusBottomSheet(BuildContext context, List<BusRoute> busList1,List<BusRoute> busList2) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
    ),
    builder: (context) {
      return DoubleBusBottomSheet(busList1:busList1 , busList2: busList2,);
    },
  );
}
