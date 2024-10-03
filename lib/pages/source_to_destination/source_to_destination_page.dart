import 'package:bus_o_pedia/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SourceToDestinationPage extends StatefulWidget {
  @override
  State<SourceToDestinationPage> createState() => _SourceToDestinationPageState();
}

class _SourceToDestinationPageState extends State<SourceToDestinationPage> {
  int _selectedIndex = 0; // Keeps track of the selected tab index

  // List of widget options based on the selected tab
  final List<Widget> _widgetOptions = [
    Center(child: Text('Home Content', style: TextStyle(fontSize: 24))),
    Center(child: Text('Tickets Content', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Content', style: TextStyle(fontSize: 24))),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index; // Change the tab index when clicked
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: AppColors.lightPrimary,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: mq.height * .25, left: mq.width * .02, right: mq.width * .02),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Material(
                      elevation: 8.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: 280,
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFf0f1f3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.my_location,
                                            color: AppColors.lightPrimary,
                                          ),
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
                                    labelText: 'From',
                                    labelStyle: TextStyle(
                                      color: AppColors.lightPrimary,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        )),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: AppColors.lightPrimary,
                                          ),
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
                                    labelText: 'To',
                                    labelStyle: TextStyle(
                                      color: AppColors.lightPrimary,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        )),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    //TODO
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.lightPrimary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Search Buses',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
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
              ),
            ),
            Positioned(
              top: mq.height * .15,
              left: mq.width * .08,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bus-o-Pedia",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text("Kolkota",
                      style: TextStyle(color: Color(0xFF287c6e), fontSize: 20))
                ],
              ),
            ),
            // Display different content based on selected tab
            Padding(
              padding: EdgeInsets.only(top: mq.height * .5),
              child: _widgetOptions[_selectedIndex],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black87,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _onTabChange,
          backgroundColor: Colors.black87,
          color: Colors.grey[800],
          activeColor: Colors.white,
          tabBackgroundColor: Colors.black12,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.confirmation_number,
              text: 'Tickets',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
