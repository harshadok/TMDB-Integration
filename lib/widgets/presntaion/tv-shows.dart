import 'package:appi/widgets/discription.dart';
import 'package:appi/widgets/modified_text.dart';
import 'package:flutter/material.dart';

class TvShows extends StatelessWidget {
  const TvShows({Key? key, required this.tvshow}) : super(key: key);

  final List tvshow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: "Tv Shows", colur: Colors.white, size: 18),
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
                                  titile: tvshow[indx]['title'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      tvshow[indx]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      tvshow[indx]['poster_path'],
                                  description: tvshow[indx]['overview'],
                                  vote: tvshow[indx]['vote_average'].toString(),
                                  louch_on: tvshow[indx]['release_date'] ?? '',
                                )));
                  },
                  child: SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvshow[indx]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        ModifiedText(
                            text: tvshow[indx]['original_name'] ?? "",
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
