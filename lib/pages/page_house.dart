import 'package:carousel_slider/carousel_slider.dart';
import 'package:elki/models/house.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class PageHouse extends StatelessWidget {
  const PageHouse({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    List<String> imgList = house.images;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 0,
            ),
            child: Column(
              children: [
                BlockTitle(house: house),
                Container(
                    child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                  ),
                  items: imgList
                      .map((item) =>
                          Image.network(item, fit: BoxFit.cover, width: width))
                      .toList(),
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(house.description),
                ),
              ],
            ),
          ),
          FormBack(
            house: house,
          ),
        ],
      ),
    );
  }
}

class BlockTitle extends StatelessWidget {
  const BlockTitle({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Text(
            house.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            house.location,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${house.price} ₽",
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        const Text("/ сут."),
      ],
    );
  }
}

class FormBack extends StatelessWidget {
  const FormBack({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    Color colorBg = const Color.fromARGB(255, 116, 109, 247);
    Color colorText = Colors.white;

    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(house: house),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: colorBg,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          child: Text("Назад",
                              style: TextStyle(
                                color: colorText,
                                fontSize: 24,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
