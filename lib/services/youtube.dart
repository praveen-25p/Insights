import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:insights_flutter_website/models/video.dart';

class YoutubeService {
  // YoutubeService._intstantiate();

  // static final YoutubeService instance = YoutubeService._intstantiate();

  final String _apiKey = "AIzaSyARvKE5Sm7t5aI_Znp0IPKTHt4ECtfJRtc";
  final String _baseUrl = "www.googleapis.com";
  List<Video> _videos = [];
  String _nextPageToken = "";

  Future<void> fetchVideos() async {
    final String playlistId = "UUy3kfgzslAylg2uyNzyUvhw";
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '5',
      'pageToken': _nextPageToken,
      'key': _apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first five videos from uploads playlist
      videosJson.forEach(
        (json) {
          _videos.add(
            Video.fromMap(json['snippet']),
          );
        },
      );
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  List<Video> getVideos() {
    return _videos;
  }
}
