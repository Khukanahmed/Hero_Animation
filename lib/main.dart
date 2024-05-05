import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:getapps/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // timeDilation= 5.0;
    print('reload');
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero_cart(
                herophoto:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSenm8AjNrkwnr_R6pcv966dQ_JGEnZDDI0It_3wvdrxv3QZICrqn5s_UF1KxlNW6Ace6Y&usqp=CAU',
                tagtitle: 'whatsup',
                producttitle: 'Whatsup- Apps',
                productsubtitle:
                    'Your personal messages and calls to friends and family are end-to-end encrypted.',
              ),
              Hero_cart(
                herophoto:
                    'https://static.vecteezy.com/system/resources/previews/018/930/698/original/facebook-logo-facebook-icon-transparent-free-png.png',
                tagtitle: 'Facebook',
                producttitle: 'Facebook- Apps',
                productsubtitle:
                    'Your personal messages and calls to friends and family are end-to-end encrypted.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hero_cart extends StatelessWidget {
  const Hero_cart({
    super.key,
    required this.tagtitle,
    required this.herophoto,
    required this.producttitle,
    required this.productsubtitle,
  });

  final String tagtitle;
  final String herophoto;
  final String producttitle;
  final String productsubtitle;

  @override
  Widget build(BuildContext context) {
    return PhotoHero(
      tag: tagtitle,
      photo: herophoto,
      width: 100.0,
      onTap: () {
        timeDilation = 5;
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Flippers Page'),
            ),
            body: Container(
              // Set background to blue to emphasize that it's a new route.
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: PhotoHero(
                      tag: tagtitle,
                      photo: herophoto,
                      width: 300.0,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    producttitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1
                    ),
                  ),
                  Text(productsubtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),)
                ],
              ),
            ),
          );
        }));
      },
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {super.key,
      required this.photo,
      this.onTap,
      required this.width,
      required this.tag});

  final String photo;
  final VoidCallback? onTap;
  final double width;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
