import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CircleAvatar(
        backgroundColor: Colors.white54,
        radius: 60,
        child: Image.asset('assets/logo/mark1.png'),
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black54, Colors.black12]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo,
                SizedBox(
                  height: 12,
                ),
                Text(
                  "We Welcomes You!",
                  style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white60),
                ),

                Text(
                  "Your Journey Starts From Here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white60),
                ),
                SizedBox(height: 30),

                //Registration page details feild...

                //Name

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // Enter E-mail ID

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter E-mail Id",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // Enter Date Of Birth

                // Enter Mobile No.

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter Mobile No",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter Your Date of Birth",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        suffixIcon: Icon(
                          Icons.calendar_month_sharp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // Enter Password

                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // terms and conditions agreement

                SizedBox(
                  height: 40,
                ),

                //Submit Button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.black38,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white70),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}