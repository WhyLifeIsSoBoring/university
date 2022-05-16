import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialEventItem extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  final void Function() onTap;

  const SocialEventItem({
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
            SizedBox(height: 4.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  date,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
