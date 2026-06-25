import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tp/twitter/tweet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor:kIsWeb ?  Colors.white : null,
        title: Text('Twitter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          NavBar(),
          FutureBuilder(
              future: getAllTweets(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  final listTweets = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: listTweets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TweetContent(tweet: listTweets[index]);
                      },
                    ),
                  );
                }
                return Text("Les tweets arrivent");
              },
          )
        ],
      ),
    );
  }
}
Future<List<Tweet>> getAllTweets() async{
  final responseTweet = get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));
  String body = (await responseTweet).body;
  List<dynamic> listMapTweet = jsonDecode(body) as List<dynamic>;
  List<Tweet> listTweets = listMapTweet.map(
          (map)=> Tweet.fromMap(map as Map<String,dynamic>)
  ).toList();
  return listTweets;
}
class TweetActions extends StatefulWidget {
  TweetActions({super.key});

  @override
  State<TweetActions> createState() => _TweetActionsState();
}

class _TweetActionsState extends State<TweetActions> {
  bool isLiked = false;
  int nbRetweets = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.reply)),
        Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              nbRetweets += 1;
            });
          },
          icon: Icon(Icons.repeat, color: nbRetweets != 0 ? Colors.blue : null),
        ),
        Text("$nbRetweets"),
        Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : null,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class TweetContent extends StatelessWidget {
  const TweetContent({
    required this.tweet,
    super.key});
  final Tweet tweet;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image.network(tweet.profile,
            errorBuilder: (_,_,_)=>Icon(Icons.broken_image_outlined),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tweet.author),
                      Text(tweet.created_date.toString(),
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Expanded(
                    child: Text(tweet.message),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white);
    return Container(
      color: Color(0xFF58B0F0),
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          SizedBox(width: 32,),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit,color: Colors.white,),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text("Accueil", style: textStyle),
          ),
          Spacer(),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white,),
          ),
          SizedBox(width: 32,),

        ],
      ),
    );
  }
}

