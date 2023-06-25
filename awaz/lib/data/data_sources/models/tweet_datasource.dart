import 'dart:convert';
import 'dart:html';

import 'package:awaz/data/models/tweet_model.dart';
import 'package:http/http.dart' as http;

class TweetDataSource {
  static Future<List<TweetModel>> getAllTweet() async {
    List<TweetModel> TweetList = [];
    http.Response response = await http
        .get(Uri.parse("https://648617c6a795d24810b7b3e8.mockapi.io/tweet"));
    if (response.statusCode == 200) {
      List parsedJson = jsonDecode(response.body);
      for (var tweet in parsedJson) {
        TweetList.add(TweetModel.fromJson(tweet));
      }
    }
    return TweetList;
  }

  static Future<bool> PostTweet(String name, String tweet) async {
    if (name == null && tweet == null) return false;
    http.Response response = await http.post(
        Uri.parse("https://648617c6a795d24810b7b3e8.mockapi.io/tweet"),
        body: {
          "author": name,
          "text": tweet,
        });

    return false;
  }
}
