import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/podcast_model.dart';
import 'package:untitled/models/podcasts.dart';

import 'drawer_item.dart';

class PodcastWindowBody extends StatefulWidget {
  const PodcastWindowBody({super.key});

  @override
  State<PodcastWindowBody> createState() => _PodcastWindowBodyState();
}

class _PodcastWindowBodyState extends State<PodcastWindowBody> {
  late Future<List<Podcast>> podcasts;
  @override
  void initState() {
    super.initState();
    print('initState');
    podcasts = fetchPodcasts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: FutureBuilder<List<Podcast>>(
            future: podcasts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PodcastModel(podcast: snapshot.data![index]);
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }));
  }
}