import 'package:flutter/material.dart';

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
          Column(children: [TweetContent(), TweetActions()]),
        ],
      ),
    );
  }
}

class TweetActions extends StatelessWidget {
  const TweetActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceAround,
      children:
      [
        IconButton(onPressed: () {}, icon: Icon(Icons.reply)),
        IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
        //IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red,))
      ]
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text("Nouveau", style: textStyle),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Accueil", style: textStyle),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Rechercher", style: textStyle),
          ),
        ],
      ),
    );
  }
}
