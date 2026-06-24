import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tp/twitter/tweet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //foregroundColor: Colors.white,
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
                        return TweetContent();
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
  const TweetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image.network('https://picsum.photos/120?image=9'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("LaCrevette@Chocolate"),
                      Text("50s", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat obcaecat veniam nibh tation praesent praesent, quod voluptate pariatur voluptua eros ipsum gubergren sanctus non kasd est pariatur non. Quod iusto obcaecat facilisis officia tempor, nobis ullamco nam invidunt laboris feugait quis velit illum clita aliquam dignissim adipisici anim. Cupiditat tation fugiat adipisici voluptua mollit voluptua adipiscing vulputate officia eu suscipit aliqua est luptatum. Aliquid pariatur sea elit illum vel. Eirmod eros iriure elit deserunt aliquid nibh. Feugait suscipit facilisi quis eleifend. Mazim delenit aliqua. Lorem commodo nulla.",
                    ),
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

