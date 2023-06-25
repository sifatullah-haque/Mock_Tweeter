import 'package:awaz/data/data_sources/models/tweet_datasource.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TweetDataSource.getAllTweet();
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/250?image=8'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sifatullah Haque"),
              Text(
                "2023-06-11T13:04:04.863Z",
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          subtitle: Text(
              "lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet"),
        ),
      ),
    );
  }
}
