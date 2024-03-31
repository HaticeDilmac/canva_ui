// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List iconList = [
    IconModel(image: 'assets/docs.png', text: 'Docs'),
    IconModel(image: 'assets/whiteboard.png', text: 'Whiteboard'),
    IconModel(image: 'assets/print.png', text: 'Print'),
    IconModel(image: 'assets/presentation.png', text: 'Presentation'),
    IconModel(image: 'assets/socialMedia.png', text: 'Social Media'),
    IconModel(image: 'assets/website.png', text: 'Website'),
    IconModel(image: 'assets/video.png', text: 'Video'),
  ];

  final List textList = ['Populer', 'Marketing', 'Gifts', 'Stationery'];

  final List littleCardList = [
    IconModel(image: 'assets/instagramPost.png', text: 'Instagram Post'),
    IconModel(image: 'assets/mobilevideo.png', text: 'Mobile Video'),
    IconModel(image: 'assets/yourStory.png', text: 'Your Story'),
  ];

  final List cardList = [
    CardModel(image: 'assets/card1.png'),
    CardModel(image: 'assets/card3.png'),
    CardModel(image: 'assets/card2.png'),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[800]!, // Üstte koyu mavi
              const Color.fromARGB(255, 66, 227, 245), // Orta açık mavi
              Colors.blue[800]!, // Altta üstteki mavi
            ])),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SearchBarWidget(),
                const SizedBox(
                  height: 20,
                ),
                IconWidgetList(iconList: iconList)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              'Print it, gift it, wear it',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          TextListWidget(textList: textList),
          LittleListWidget(littleCardList: littleCardList),
          CardListWidget(cardList: cardList),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(
          color: Color.fromRGBO(141, 17, 198, 1),
        ),
        selectedItemColor: const Color.fromARGB(255, 141, 17, 198),
        backgroundColor: const Color.fromARGB(255, 141, 17, 198),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
              color: Colors.grey,
            ),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 141, 17, 198),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.format_paint,
              color: Colors.grey,
            ),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/princes.png',
              height: 30,
              color: Colors.grey,
            ),
            label: 'Canva Pro',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class IconWidgetList extends StatelessWidget {
  const IconWidgetList({
    super.key,
    required this.iconList,
  });

  final List iconList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: iconList.length,
          itemBuilder: (context, index) {
            var list = iconList[index];
            return Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        list.image,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                  Text(
                    list.text,
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class CardListWidget extends StatelessWidget {
  const CardListWidget({
    super.key,
    required this.cardList,
  });

  final List cardList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            var list = cardList[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  list.image,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 320,
                ),
              ),
            );
          }),
    );
  }
}

class LittleListWidget extends StatelessWidget {
  const LittleListWidget({
    super.key,
    required this.littleCardList,
  });

  final List littleCardList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: littleCardList.length,
          itemBuilder: (context, index) {
            var lList = littleCardList[index];
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset(
                    lList.image,
                    height: 100,
                  ),
                  Center(
                      child: Text(
                    lList.text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            );
          }),
    );
  }
}

class TextListWidget extends StatelessWidget {
  const TextListWidget({
    super.key,
    required this.textList,
  });

  final List textList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: textList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(3),
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 226, 226),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text(textList[index])),
            );
          }),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.menu),
        Container(
          width: 360,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your content or Canva\'s',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.camera_alt_outlined),
            ],
          ),
        ),
      ],
    );
  }
}

class IconModel {
  String image;
  String text;

  IconModel({required this.image, required this.text});
}

class CardModel {
  String image;

  CardModel({required this.image});
}
