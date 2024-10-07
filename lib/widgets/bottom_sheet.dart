import 'package:bus_o_pedia/pages/bus_details/bus_info.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';


class BusBottomSheet extends StatelessWidget {
  final List<BusRoute> busList;

  const BusBottomSheet({super.key, required this.busList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "${busList.length} Bus Available",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: busList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusDetailsPage(bus: busList[index],)));
                  },
                  child: ListTile(
                    title: Text(busList[index].name),
                    subtitle: Text(busList[index].route),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}