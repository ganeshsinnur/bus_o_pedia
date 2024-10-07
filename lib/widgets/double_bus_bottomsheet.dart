

import 'package:flutter/material.dart';
import '../models/model.dart';

class DoubleBusBottomSheet extends StatefulWidget {
  final List<BusRoute> busList1; // Buses from source to stop location
  final List<BusRoute> busList2; // Buses from stop location to destination

  const DoubleBusBottomSheet({
    super.key,
    required this.busList1,
    required this.busList2,
  });

  @override
  _DoubleBusBottomSheetState createState() => _DoubleBusBottomSheetState();
}

class _DoubleBusBottomSheetState extends State<DoubleBusBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          // Tab bar for selecting which list to show
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'From Source to Stop',),
              Tab(text: 'From Stop to Destination'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // First list (Buses from source to stop location)
                ListView.builder(
                  itemCount: widget.busList1.length,
                  itemBuilder: (context, index) {
                    final bus = widget.busList1[index];
                    return ListTile(
                      title: Text(bus.name),
                      subtitle: Text(
                          'Route: ${bus.route}'),
                    );
                  },
                ),
                // Second list (Buses from stop location to destination)
                ListView.builder(
                  itemCount: widget.busList2.length,
                  itemBuilder: (context, index) {
                    final bus = widget.busList2[index];
                    return ListTile(
                      title: Text(bus.name),
                      subtitle: Text(
                          'Route: ${bus.route}'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}









/*
import 'package:flutter/material.dart';
import '../models/model.dart';

class DoubleBusBottomSheet extends StatelessWidget {
  final List<BusRoute> busList1; // Buses from source to stop location
  final List<BusRoute> busList2; // Buses from stop location to destination

  const DoubleBusBottomSheet({
    super.key,
    required this.busList1,
    required this.busList2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          // First list (Buses from source to stop location)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('From Source to Stop Location',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: busList1.length,
                    itemBuilder: (context, index) {
                      final bus = busList1[index];
                      return ListTile(
                        title: Text(bus.name),
                        subtitle: Text(
                            'Route: ${bus.route}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(), // Divider between the two lists

          // Second list (Buses from stop location to destination)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('From Stop Location to Destination',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: busList2.length,
                    itemBuilder: (context, index) {
                      final bus = busList2[index];
                      return ListTile(
                        title: Text(bus.name),
                        subtitle: Text(
                            'Route: ${bus.route}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
