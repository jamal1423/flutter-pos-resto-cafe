// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_pos/pages/page_histori.dart';
import 'package:app_pos/pages/page_home.dart';
import 'package:app_pos/pages/page_login.dart';
import 'package:app_pos/pages/page_pos.dart';
import 'package:app_pos/public/public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const PageLogin(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          PageHome(),
          PageHistori(),
        ],
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0 ? null :  FloatingActionButton(
        onPressed: () {
          nextPage(context, PagePos());
        },
        // backgroundColor: Color.fromARGB(255, 134, 4, 151),
        backgroundColor: Color.fromARGB(255, 1, 94, 110),
        child: Icon(Icons.point_of_sale_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 211, 210, 210), // Warna border
              width: 0.5,        // Ketebalan border
            ),
          ),
        ),
        child: StylishBottomBar(
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.3,
            padding: EdgeInsets.only(left: 20, right: 20)
          ),
          iconSpace: 5.0,
          
          items: [
            BottomBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const Text('Home'),
              ),
              selectedColor: Color.fromARGB(255, 18, 151, 71),
              backgroundColor: Color.fromARGB(255, 3, 70, 29),
            ),
            BottomBarItem(
              icon: const Icon(Icons.receipt_long),
              title: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const Text('Histori'),
              ),
              selectedColor: Color.fromARGB(255, 18, 151, 71),
              backgroundColor: Color.fromARGB(255, 3, 70, 29),
            ),
          ],
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          currentIndex: selected,
          onTap: (index) {
            setState(() {
              selected = index;
              controller.jumpToPage(index);
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            });
          },
        ),
      ),
    );
  }
}
