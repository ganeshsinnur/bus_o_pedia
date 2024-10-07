import 'package:bus_o_pedia/models/model.dart';
import 'package:bus_o_pedia/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_o_pedia/logics/APIs.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BusDetailsPage extends StatelessWidget {
  final BusRoute bus;

  const BusDetailsPage({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mq.height * 0.3,
            width: double.infinity,
            child: Stack(
              children: [
                // Shimmer effect while loading the image
                Shimmer.fromColors(
                  baseColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]!
                      : Colors.grey[300]!,
                  highlightColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[700]!
                          : Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: mq.height * 0.3,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.grey[300],
                  ),
                ),
                // Network Image
                if (bus.imageUrl != "")
                  Image.network(
                    "${APIs().imageURl}/${bus.imageUrl}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: mq.height * 0.3,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null)
                        return child; // If the image has loaded, return the actual image.
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: mq.height * 0.3,
                          color: Colors.grey[300],
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback if image fails to load
                      return Image(
                        image: AssetImage('assets/placeholder.jpg'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: mq.height * 0.3,
                      );
                    },
                  ),
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bus details and stops list
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top:16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${bus.route}",
                          style: const TextStyle(fontSize: 16),
                        ),

                      ],
                    ),
                  ),
                  Divider(),

                  Expanded(
                    child: ListView.builder(
                      itemCount: bus.stops.length,
                      itemBuilder: (context, index) {
                        return TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,

                          isFirst: index == 0,
                          isLast: index == bus.stops.length - 1,
                          indicatorStyle: IndicatorStyle(
                            width: 15,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black87,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Colors.grey,
                            thickness: 2,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.grey,
                            thickness: 2,
                          ),
                          endChild: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              bus.stops[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
