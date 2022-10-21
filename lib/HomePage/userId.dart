import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black54, Colors.black12])),
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.black45,
                      ),
                      child: Center(
                        child: Text(
                          "Profile Settings",
                          style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white54),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("Profile Settings Pressed");
                    },
                  )),

              //Log Out Button

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.black45,
                      ),
                      child: Center(
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white54),
                        ),
                      ),
                    ),
                    onTap: () => FirebaseAuth.instance.signOut(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
