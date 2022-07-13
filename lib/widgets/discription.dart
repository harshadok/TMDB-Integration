import 'package:appi/widgets/modified_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class DiscrptionWidget extends StatelessWidget {
  const DiscrptionWidget(
      {Key? key,
      this.titile,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.louch_on})
      : super(key: key);

  final String? titile;
  final String? description, bannerurl, posterurl, vote, louch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl!,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: ModifiedText(
                          text: " ⭐ Average_Rating - " + vote!,
                          colur: Colors.white,
                          size: 18))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                  text: titile ?? '', colur: Colors.white, size: 30),
            ),
            Container(
              width: 100,
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                  text: 'Release on ' + louch_on!,
                  colur: Colors.white,
                  size: 18),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 150,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      size: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
