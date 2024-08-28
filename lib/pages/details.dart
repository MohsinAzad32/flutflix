import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String imageurl;
  final String title;
  final String overview;
  final String releasedate;
  final String amount;
  final String rating;
  final String tagline;

  const DetailsScreen({
    super.key,
    required this.amount,
    required this.imageurl,
    required this.overview,
    required this.rating,
    required this.releasedate,
    required this.tagline,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          addRepaintBoundaries: true,
          children: [
            ClipRRect(
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            Text(
              '⭐ Average Rating $rating',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Times New Roman',
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Times New Roman',
              ),
            ),
            Text(
              releasedate,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Times New Roman',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    imageurl,
                    height: 250,
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    overview,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
