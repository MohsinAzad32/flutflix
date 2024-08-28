import 'package:flutflix/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  List trend = [];
  List tv = [];
  List movies = [];
  List drama = [];
  final String apikey = '9e4323c5e0b5fd412621e5ae9c3ac0f4';
  final String apitoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZTQzMjNjNWUwYjVmZDQxMjYyMWU1YWU5YzNhYzBmNCIsIm5iZiI6MTcyNDMyMjE2Mi41MjQwMiwic3ViIjoiNjZjNmU1NWM4ZmVkN2NjZDc0YzNiMDVjIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.sQx05ogQcGgpMDqzMSwwC1llEXhtHa-Djwx0xt_6igY';

  Future loadMovies() async {
    TMDB tmdb = TMDB(
      ApiKeys(
        apikey,
        apitoken,
      ),
    );
    final trending = await tmdb.v3.trending.getTrending();
    final tvShow = await tmdb.v3.tv.getPopular();
    final movie = await tmdb.v3.movies.getTopRated();
    // final dramas = await tmdb.v3.tvSeasons();
    setState(() {
      trend = trending['results'];
      tv = tvShow['results'];
      movies = movie['results'];
      // drama = dramas['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey.shade900, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Trending️‍🔥',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Times New Roman'),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trend.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(
                                amount: '',
                                // ignore: prefer_interpolation_to_compose_strings
                                imageurl: 'http://image.tmdb.org/t/p/w500' +
                                    trend[index]["poster_path"],
                                overview: trend[index]["overview"],
                                rating: trend[index]["vote_average"].toString(),
                                releasedate: trend[index]["release_date"],
                                tagline: trend[index]["tagline"] ?? 'loading',
                                title: trend[index]["title"],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            'http://image.tmdb.org/t/p/w500' +
                                trend[index]["poster_path"],
                            height: 200,
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey.shade900, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Tv Shows',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Times New Roman'),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(
                                amount: '',
                                // ignore: prefer_interpolation_to_compose_strings
                                imageurl: 'http://image.tmdb.org/t/p/w500' +
                                    trend[index]["poster_path"],
                                overview: trend[index]["overview"],
                                rating: trend[index]["vote_average"].toString(),
                                releasedate: trend[index]["release_date"],
                                tagline: trend[index]["tagline"] ?? 'loading',
                                title: trend[index]["title"],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            'http://image.tmdb.org/t/p/w500' +
                                tv[index]["poster_path"],
                            height: 200,
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey.shade900, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Movies',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Times New Roman'),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(
                                amount: '',
                                imageurl:
                                    'http://image.tmdb.org/t/p/w500${trend[index]["poster_path"]}',
                                overview: trend[index]["overview"],
                                rating: trend[index]["vote_average"].toString(),
                                releasedate: trend[index]["release_date"],
                                tagline: trend[index]["tagline"] ?? 'loading',
                                title: trend[index]["title"],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            'http://image.tmdb.org/t/p/w500' +
                                movies[index]["poster_path"],
                            height: 200,
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
