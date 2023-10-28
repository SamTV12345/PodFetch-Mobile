import 'dart:convert';

import 'package:http/http.dart' as http;


Future<List<Podcast>> fetchPodcasts() async {
  final resp = await http.get(Uri.parse('http://localhost:8000/api/v1/podcasts'));
  final array = jsonDecode(resp.body);
  List<Podcast> podcasts = [];

  if (resp.statusCode == 200) {
    podcasts.addAll(List<Podcast>.from(array.map((e) => Podcast.fromJson(e))));
    return podcasts;
  } else {
    throw Exception('Failed to load podcast');
  }
}


class Podcast {
  final int id;
  final String name;
  final String directoryId;
  final String rssfeed;
  final String imageUrl;
  final String summary;
  final String language;
  final String explicit;
  final String keywords;
  final String lastBuildDate;
  final String author;
  final bool active;
  final String originalImageUrl;
  final bool favorites;

  Podcast({required this.id, required this.name, required this.directoryId, required this.rssfeed, required this.imageUrl,
    required this.summary, required this.language, required this.explicit, required this.keywords, required this.lastBuildDate,
    required this.author, required this.active, required this.originalImageUrl, required this.favorites});


  factory Podcast.fromJson(Map<String, dynamic> json) {
    return Podcast(
      id: json['id'],
      name: json['name'],
      directoryId: json['directory_id'],
      rssfeed: json['rssfeed'],
      imageUrl: json['image_url'],
      summary: json['summary'],
      language: json['language'],
      explicit: json['explicit'],
      keywords: json['keywords'],
      lastBuildDate: json['last_build_date'],
        author: json['author'],
        active: json['active'],
        originalImageUrl: json['original_image_url'],
        favorites: json['favorites']);
  }
}