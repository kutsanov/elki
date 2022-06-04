import 'package:elki/models/house.dart';
import 'package:elki/pages/page_house.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset('assets/elki.jpg');
    if (house.images.isNotEmpty) {
      image = Image.network(house.images[0]);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageHouse(house: house),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Column(
              children: [
                image,
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarWidget(house: house),
                          PriceWidget(house: house),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Star(rating: house.rating > 0),
        const SizedBox(width: 1),
        Star(rating: house.rating > 1),
        const SizedBox(width: 1),
        Star(rating: house.rating > 2),
        const SizedBox(width: 1),
        Star(rating: house.rating > 3),
        const SizedBox(width: 1),
        Star(rating: house.rating > 4),
        const SizedBox(width: 5),
        Text(
          "${house.reviewCount} отзывов",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class Star extends StatelessWidget {
  const Star({Key? key, required this.rating}) : super(key: key);

  final bool rating;

  @override
  Widget build(BuildContext context) {
    String image =
        (rating == true) ? "assets/star.svg" : "assets/star_gray.svg";
    return SvgPicture.asset(image);
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
