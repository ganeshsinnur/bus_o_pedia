import '../models/model.dart';

class funs{
  List<BusRoute> parseBusRoutes(List<String> routesData) {
    return routesData.map((routeString) {
      var parts = routeString.split(':');
      var stopsString=parts[2].substring(0, parts[2].length - 2);
      var stops = stopsString.split(',').map((s) => s.trim()).toList();
      //log("${parts[1]}");
      return BusRoute(
        name: parts[0].trim(),
        route: parts[1].substring(0, parts[1].length - 5).trim(),
        status: parts[3].trim(),
        imageUrl: parts[4].trim(),
        stops: stops,
      );
    }).toList();
  }


  List<String> getStopsBetween(List<String> stops, String source, String destination) {
    int startIndex = stops.indexOf(source);
    int endIndex = stops.indexOf(destination);

    if (startIndex == -1 || endIndex == -1 || startIndex >= endIndex) {
      return [];
    }

    return stops.sublist(startIndex, endIndex + 1);
  }

  List<BusRoute> searchBusRoutes(List<BusRoute> busRoutes, String source, String destination) {
    return busRoutes.where((busRoute) {
      // Check if both source and destination exist in the stops
      int sourceIndex = busRoute.stops.indexOf(source);
      int destinationIndex = busRoute.stops.indexOf(destination);

      // Ensure that the source comes before the destination
      return sourceIndex != -1 && destinationIndex != -1 && sourceIndex < destinationIndex;
    }).toList();
  }

  // Function to get all unique stops
  List<String> getAllUniqueStops(List<BusRoute> allBus) {
    Set<String> allStops = {}; // Using a set to store unique stops

    // Iterate over each BusRoute in the list
    for (var busRoute in allBus) {
      allStops.addAll(busRoute.stops); // Add all stops from each bus route
    }

    // Convert the set back to a list and return
    return allStops.toList();
  }

   final BusRoute emptyBus=BusRoute(imageUrl: "",name: "",route: "",status: "",stops: []);


  List<BusRoute> sortBus(List<BusRoute> busRoutes) {
    busRoutes.sort((a, b) => a.name.compareTo(b.name)); // sort in place
    return busRoutes; // return the sorted list
  }


}

