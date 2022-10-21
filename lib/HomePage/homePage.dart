import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'userId.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int pageIndex = 0;
  final pages = [
    const Page1(),
    const Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Vstream       ",
              style: GoogleFonts.bebasNeue(
                color: Colors.white70,
                textStyle: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Home page Icon
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      )),

            // User Profile Icon
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    : Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      )),
          ],
        ),
      ),
    );
  }
}

// Home page code

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black54, Colors.black12])),
      child: Text("Home page pr hai"),
    );
  }
}

// User Profile code

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black54, Colors.black12])),
      child: Account(),
    );
  }
}
