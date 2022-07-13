import 'package:appi/widgets/discription.dart';
import 'package:appi/widgets/modified_text.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: "Trending Movies", colur: Colors.white, size: 18),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext cox, int indx) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscrptionWidget(
                                  titile: trending[indx]['title'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[indx]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[indx]['poster_path'],
                                  description: trending[indx]['overview'],
                                  vote:
                                      trending[indx]['vote_average'].toString(),
                                  louch_on:
                                      trending[indx]['release_date'] ?? '',
                                )));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[indx]['poster_path']))),
                        ),
                        ModifiedText(
                            text: trending[indx]['title'] ?? "",
                            colur: Colors.white,
                            size: 18)
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
