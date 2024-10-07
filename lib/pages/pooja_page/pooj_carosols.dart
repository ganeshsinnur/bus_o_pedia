import 'package:bus_o_pedia/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DropdownCarouselPage extends StatefulWidget {
  @override
  _DropdownCarouselPageState createState() => _DropdownCarouselPageState();
}

class _DropdownCarouselPageState extends State<DropdownCarouselPage> {
  // Data for dropdown 1
  final Map<String, List<String>> dropdownItems1 = {
    'North Kolkata': [
      '${Assets.northPath}/pujo_porikroma_0.jpg',
      '${Assets.northPath}/pujo_porikroma_1.jpg',
      '${Assets.northPath}/pujo_porikroma_2.jpg',
      '${Assets.northPath}/pujo_porikroma_3.jpg',
      '${Assets.northPath}/pujo_porikroma_4.jpg',
      '${Assets.northPath}/pujo_porikroma_5.jpg',
      '${Assets.northPath}/pujo_porikroma_6.jpg',
      '${Assets.northPath}/pujo_porikroma_7.jpg',

    ],
    'South Kolkata': [
      '${Assets.southPath}/pujo_porikroma_00.jpg',
      '${Assets.southPath}/pujo_porikroma_01.jpg',
      '${Assets.southPath}/pujo_porikroma_02.jpg',
      '${Assets.southPath}/pujo_porikroma_03.jpg',
      '${Assets.southPath}/pujo_porikroma_04.jpg',
      '${Assets.southPath}/pujo_porikroma_05.jpg',
      '${Assets.southPath}/pujo_porikroma_06.jpg',
      '${Assets.southPath}/pujo_porikroma_07.jpg',
      '${Assets.southPath}/pujo_porikroma_08.jpg',
      '${Assets.southPath}/pujo_porikroma_09.jpg',
      '${Assets.southPath}/pujo_porikroma_10.jpg',
      '${Assets.southPath}/pujo_porikroma_12.jpg',

    ]
  };

  String? selectedOption1="North Kolkata";
  CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Puja Parikrama')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Dropdown 1 with Carousel
              DropdownButton<String>(
                hint: const Text('Select Option 1'),
                value: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value;
                    _currentIndex = 0; // Reset index when option changes
                    _carouselController.jumpToPage(0);
                  });
                },
                items: dropdownItems1.keys.map((String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (selectedOption1 != null)
                Column(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: 200,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.4,
                        disableCenter: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: dropdownItems1[selectedOption1]!.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                _showFullScreenImage(context, imageUrl);
                              },
                              child: Image.asset(imageUrl),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    DotsIndicator(
                      dotsCount: dropdownItems1[selectedOption1]!.length,
                      position: _currentIndex.toInt(),
                      decorator: DotsDecorator(
                        activeColor: dropdownItems1[selectedOption1]!.length==13?Color(0xFFFECB18):Color(0xFF48A2C4),
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          child: PhotoView(
            imageProvider: AssetImage(imageUrl),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        );
      },
    );
  }
}
