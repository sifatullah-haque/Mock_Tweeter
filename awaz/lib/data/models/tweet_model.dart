class TweetModel {
  int? id;
  String? writer;
  String? tweet;
  String? Posted_At;

  TweetModel.fromJson(Map json) {
    id = int.parse(json["id"]);
    writer = json["author"];
    tweet = json["body"];
    Posted_At = json["date"];
  }
}
