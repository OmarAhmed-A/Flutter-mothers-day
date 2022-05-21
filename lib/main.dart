import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'images/aron-yigin-Ndh5am-qw8k-unsplash.jpg',
  'images/charlesdeluvio-0v_1TPz1uXw-unsplash.jpg',
  'images/charlesdeluvio-RDjZh9dqlP4-unsplash.jpg',
  'images/diego-ph-fIq0tET6llw-unsplash.jpg',
  'images/family.png',
  'images/florian-klauer-nptLmg6jqDo-unsplash (1).jpg',
  'images/florian-klauer-nptLmg6jqDo-unsplash.jpg',
  'images/hari-krishnan-7Tec2ehoaZw-unsplash.jpg',
  'images/jon-parry-C8eSYwQkwHw-unsplash.jpg',
  'images/jonny-caspari-wsvCC6UyKjs-unsplash.jpg',
  'images/luke-southern-k5o-cuu9E6g-unsplash.jpg',
  'images/mae-mu-Rz5o0osnN6Q-unsplash.jpg',
  'images/mae-mu-vbAEHCrvXZ0-unsplash.jpg',
  'images/marcel-l-PQewPJqNKwQ-unsplash.jpg',
  'images/mike-meyers--haAxbjiHds-unsplash.jpg',
  'images/mostafa-meraji-hL0rIqulwMM-unsplash.jpg',
  'images/oleg-magni-_6Uy6nwVohE-unsplash.jpg',
  'images/oppo-HA5rQ_XfBD0-unsplash.jpg',
  'images/ruslan-bardash-4kTbAMRAHtQ-unsplash.jpg',
  'images/taylor-heery-B2_-q66S8NQ-unsplash.jpg',
  'images/tirza-van-dijk-cNGUw-CEsp0-unsplash.jpg',
  'images/vadim-kaipov-f6jkAE1ZWuY-unsplash.jpg',
  'images/vika-wendish-06X7AIB00p8-unsplash.jpg'
];

void main() => runApp(const MyApp());

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const CarouselDemoHome(),
            //'/image': (ctx) => const ImageSlider(),
            '/fullscreen': (ctx) => const FullscreenSliderDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  // ignore: use_key_in_widget_constructors
  const DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('❤️❤️❤️مفيش احسن منكم'),
        actions: [
          IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: const <Widget>[
          //DemoItem('Image carousel slider', '/image'),
          DemoItem(
              '❤️❤️❤️بنحبكم قوي قوي يا احلى بابا و ماما في الدنيا ربنا يبارك فيكم كل سنه وانتم طيبين❤️❤️❤️\n(CLICK HERE)',
              '/fullscreen'),
        ],
      ),
    );
  }
}

/* class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image slider demo')),
      body: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
        .map((item) => Center(
            child:
                Image.asset(item, fit: BoxFit.cover, width: 1000)))
        .toList(),
      ),
    );
  }
} */

class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Center(
                        child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}
