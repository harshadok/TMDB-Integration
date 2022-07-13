import 'package:appi/widgets/discription.dart';
import 'package:appi/widgets/modified_text.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  const TopRated({Key? key, required this.topRated}) : super(key: key);

  final List topRated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: "Top Rated Movies", colur: Colors.white, size: 18),
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
                                  titile: topRated[indx]['title'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[indx]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[indx]['poster_path'],
                                  description: topRated[indx]['overview'],
                                  vote:
                                      topRated[indx]['vote_average'].toString(),
                                  louch_on:
                                      topRated[indx]['release_date'] ?? '',
                                )));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[indx]['poster_path']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        ModifiedText(
                            text: topRated[indx]['original_name'] ?? "",
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
