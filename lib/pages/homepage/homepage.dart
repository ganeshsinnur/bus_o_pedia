import 'package:bus_o_pedia/pages/homepage/widgets/drawer.dart';
import 'package:bus_o_pedia/pages/pooja_page/pooj_carosols.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bus_o_pedia/logics/logic.dart';
import 'package:bus_o_pedia/logics/routes.dart';
import 'package:bus_o_pedia/widgets/bottom_sheet.dart';
import 'package:bus_o_pedia/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../models/model.dart';
import '../bus_for_location/bus_for_loc_screen.dart';
import '../bus_route/bus_route_screen.dart';
import '../source_to_destination/from_to_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<BusRoute> busRoutes;
  late final List<String> city;


  @override
  void initState() {
    busRoutes = funs().parseBusRoutes(Routes().routes1);
    city = (funs().getAllUniqueStops(busRoutes));

    super.initState();
  }

  @override
  void dispose() {
    _toController.dispose();
    _fromController.dispose();
    super.dispose();
  }

  final TextEditingController _toController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();

  List<String> getCity(String query) {
    return city
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.surface,
          color: Colors.grey[600],
          activeColor: Theme.of(context).colorScheme.primary,
          tabBackgroundColor: Theme.of(context).colorScheme.surface,
          tabActiveBorder:
              Border.all(color: isDarkTheme ? Colors.white : Colors.black),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          gap: 8,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.directions_bus_sharp,
              text: 'Search Buses',
              iconActiveColor: isDarkTheme ? Colors.white : Colors.black,
              textColor: isDarkTheme ? Colors.white : Colors.black,
            ),
            GButton(
              icon: FontAwesomeIcons.route,
              text: 'Search Route',
              iconActiveColor: isDarkTheme ? Colors.white : Colors.black,
              textColor: isDarkTheme ? Colors.white : Colors.black,
            ),
            GButton(
              icon: FontAwesomeIcons.locationDot,
              text: 'Bus for Loc',
              iconActiveColor: isDarkTheme ? Colors.white : Colors.black,
              textColor: isDarkTheme ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      drawer: buildDrawer(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            //background
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(color: const Color(0xff072e41)),
                ),
                Expanded(
                  flex: 6,
                  child:
                      Container(color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
            //foreGround
            Positioned(
              top: 40,
              left: 10,
              child: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            Positioned(
              top: mq.height * .08,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.logo, height: 100),
                  const SizedBox(height: 10),
                  const Text("Kolkata Bus-o-pedia",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  // Conditional rendering of widgets based on selected index
                  if (_selectedIndex == 0) ...[
                    const SourceToDestinationPage()
                  ] else if (_selectedIndex == 1) ...[
                    SearchRouteWidget(), // Add the SearchRouteWidget here
                  ] else if (_selectedIndex == 2) ...[
                    const BusForLocationPage()
                    // Placeholder for Bus for Loc
                  ],
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DropdownCarouselPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/durga_mata.png",
                            height: 150,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "সকলকে জানাই শুভ \nশারদীয়ার আন্তরিক \nপ্রীতি ও ুভেচ্ছা।",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              //color: theme.colorScheme.primary, // Adapt to theme
                              fontSize: 20,
                            ),
                          )
                          //Text(,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showBusBottomSheet(BuildContext context, List<BusRoute> busList) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
    ),
    builder: (context) {
      return BusBottomSheet(
        busList: busList,
      );
    },
  );
}
