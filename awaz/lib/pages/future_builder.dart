import 'package:awaz/data/data_sources/models/tweet_datasource.dart';
import 'package:awaz/data/models/tweet_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const future());
TextEditingController _nameTextField = TextEditingController();
TextEditingController _tweetTextField = TextEditingController();

class future extends StatefulWidget {
  const future({super.key});

  @override
  State<future> createState() => _futureState();
}

class _futureState extends State<future> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              height: 600.0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _nameTextField,
                                      decoration: const InputDecoration(
                                        hintText: "Name",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _tweetTextField,
                                      decoration: const InputDecoration(
                                        hintText: "Write your tweet here",
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        String? name = _nameTextField.text;
                                        String? tweet = _tweetTextField.text;
                                        TweetDataSource.PostTweet(name, tweet);
                                      },
                                      child: const Text("Post"))
                                ],
                              ),
                            ));
                  },
                  child: const Text("Post a tweet"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Refresh")),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: FutureBuilder(
              future: TweetDataSource.getAllTweet(),
              builder: (BuildContext context, AsyncSnapshot sn) {
                if (sn.hasError) {
                  return const Center(child: Text("Error Loading Data"));
                }
                if (sn.hasData) {
                  List tweets = sn.data;
                  return ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=8'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${tweets[index].writer}"),
                            // Text(
                            //   "${tweets[index].Posted_At}",
                            //   style: const TextStyle(fontSize: 12.0),
                            // ),
                          ],
                        ),
                        subtitle: Text("${tweets[index].tweet}"),
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
