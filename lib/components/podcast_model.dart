import 'package:flutter/material.dart';

import '../models/podcasts.dart';

class PodcastModel extends StatelessWidget{
  final Podcast podcast;

  const PodcastModel({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )),
        onPressed: () {
          print("Navigating to podcast ${podcast.name}");
        },
        child: Column(
      children: [
        Image(
          image: NetworkImage(podcast.imageUrl),
          width: 100,
          height: 100,
        ),
        Text(podcast.name),
      ]
    ));
  }
}