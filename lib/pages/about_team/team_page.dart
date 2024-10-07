import 'package:bus_o_pedia/models/model.dart';
import 'package:bus_o_pedia/models/team_model.dart';
import 'package:bus_o_pedia/pages/about_team/widgets/namecard.dart';
import 'package:bus_o_pedia/utils/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {



  List<member> teamMembers=[
    member(name: "Souvik Mukherjee", designation: "President", imagePath: "${Assets.contactPath}souvik_mukherjee.webp"),
    member(name: "Aniket Banerjee", designation: "General Secretary/ App Developer", imagePath: "${Assets.contactPath}aniket_banerjee.webp"),
    member(name: "Siddhartha Guha", designation: "Treasurer", imagePath: "${Assets.contactPath}siddhartha_guha.webp"),
    member(name: "Arnab Roy", designation: "Vice President", imagePath: "${Assets.contactPath}arnab_roy.webp"),
    member(name: "Abhinaba Paul", designation: "Joint Secretary", imagePath: "${Assets.contactPath}abhinaba_paul.webp"),
    member(name: "Bijan Dutta", designation: "Joint Treasurer", imagePath: "${Assets.contactPath}bijan_dutta.webp"),
    member(name: "Trishik Bose", designation: "Instagram in-charge", imagePath: "${Assets.contactPath}trishik_bose.webp"),
    member(name: "Pratim Saha", designation: "Moderator", imagePath: "${Assets.contactPath}pratim_saha.webp"),
    member(name: "Soumen Mondal", designation: "Moderator", imagePath: "${Assets.contactPath}soumen_mondal.webp"),
    member(name: "Souvanik Sanyal", designation: "Moderator", imagePath: "${Assets.contactPath}souvanik_sanyal.webp"),
    member(name: "Abhiraj Das", designation: "Moderator", imagePath: "${Assets.contactPath}abhiraj_das.webp"),
    member(name: "Suvodeep Bhattacharya", designation: "Moderator/Page Editor", imagePath: "${Assets.contactPath}suvodeep_bhattacharya.webp"),
    member(name: "Arunopal Banerjee", designation: "Web Developer", imagePath: "${Assets.contactPath}arunopal_banerjee.webp"),
    member(name: "Sayantan Maiti", designation: "Web Developer", imagePath: "${Assets.contactPath}sayantan_maiti.webp"),
    member(name: "Debarun  Bhattacharjee", designation: "Group Expert", imagePath: "${Assets.contactPath}debarun_bhattacharjee.webp"),
    member(name: "Debangsu Mukherjee", designation: "Group expert", imagePath: "${Assets.contactPath}debangsu_mukherjee..jpg"),
    member(name: "Sagarmoy Banerjee", designation: "Group expert", imagePath: "${Assets.contactPath}sagarmoy_banerjee.jpg"),
    member(name: "Saurav Mukherjee", designation: "Moderator/PageEditor", imagePath: "${Assets.contactPath}saurav_mukherjee.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Team Members"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 3),
              const Text(
                "Meet our incredible team!",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  return NameCard(
                    name: teamMembers[index].name,
                    position: teamMembers[index].designation,
                    imagePath: teamMembers[index].imagePath,
                  );
                },
              ),
              const SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16,),// Space before "Inspired by"
              const Text(
                "Inspired by",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              NameCard(name: "Tito Saha", position: " ", imagePath: '${Assets.contactPath}inspire02.jpg'),
              NameCard(name: "CSBS", position: "", imagePath: '${Assets.contactPath}inspire01.png'),
            ],
          ),
        ),
      ),
    );
  }

}

List<BusRoute> findBusesByQuery(String query, List<BusRoute> bus) {
  String normalizedQuery = query.toLowerCase();
  return bus.where((route) {
    return route.stops.any((stop) => stop.toLowerCase().contains(normalizedQuery));
  }).toList();
}
