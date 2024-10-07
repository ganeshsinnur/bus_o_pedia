import 'package:bus_o_pedia/pages/about_team/team_page.dart';
import 'package:bus_o_pedia/pages/info/info_page.dart';
import 'package:bus_o_pedia/pages/pooja_page/pooj_carosols.dart';
import 'package:bus_o_pedia/test.dart';
import 'package:bus_o_pedia/themes/colors.dart';
import 'package:bus_o_pedia/utils/assets_path.dart';
import 'package:flutter/material.dart';
import '../../news_page/news_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildDrawer(context) {
  return Drawer(
    child: Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.appPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.logo,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Kolkata Bus-o-pedia',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading:  Icon(Icons.home,color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.appPrimary,),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  },
              ),
              ListTile(
                leading:  Icon(Icons.people_alt_rounded,color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.appPrimary,),
                title: const Text('Meet the Team'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const TeamPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading:  Icon(Icons.menu_book_sharp,color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.appPrimary,),
                title: const Text('News'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const NewsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  Assets.kalasha,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                title: const Text('Puja Parikrama'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DropdownCarouselPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading:  Icon(Icons.info_outline_rounded,color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.appPrimary,),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AboutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(0),
          child: Text("Official App of\nTeam Kolkata bus-o-pedia",style: TextStyle(fontSize: 15,color: Colors.grey,),textAlign: TextAlign.left,),
        ),
        const Divider(), // Optional, for visual separation
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.mail,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.appPrimary,
                ),
                onPressed: () {
                  _launchEmailURL("kolbusopedia@gmail.com");
                  //_launchURL();
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.appPrimary,
                ),
                onPressed: () {
                  _launchURL("https://www.instagram.com/kolbusopedia");
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.appPrimary,
                ),
                onPressed: () {
                  _launchURL("http://www.facebook.com/kolbusopedia");
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.appPrimary,
                ),
                onPressed: () {
                  _launchURL("https://x.com/KolBusoPedia");
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url); // Use Uri.parse to handle the full URL
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Cannot launch URL";
  }
}

Future<void> _launchEmailURL(String email) async {
  String url = 'mailto:$email?subject=&body=';
  final Uri uri = Uri.parse(url); // Use Uri.parse to handle the full URL
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Cannot launch URL";
  }
}
