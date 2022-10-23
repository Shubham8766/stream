import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passHid = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim(),

    );
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  // login with google

  googleLogin() async {

    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);


    } catch (error) {
      print(error);
    }
  }



  @override
  Widget build(BuildContext context) {

    //App logo

    final logo = Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CircleAvatar(
        backgroundColor: Colors.white54,
        radius: 70,
        child: Image.asset('assets/logo/mark1.png'),
      ),
    );



    // Google logo for sign in with google
    final google = Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/logo/google.png'),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black54, Colors.black12])),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logo,

                  SizedBox(
                    height: 20,
                  ),

                  // Text Welcome and hello
                  Text(
                    'Hello Again!',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome Back, We are waiting for you!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // For email enter box

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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter User id',
                          hintStyle:
                          TextStyle(fontSize: 18, color: Colors.white60),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 2,
                  ),

                  // For password enter box

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        obscureText: passHid,
                        decoration: InputDecoration(
                          hintText: '   Enter Password',
                          hintStyle:
                          TextStyle(fontSize: 18, color: Colors.white60),
                          suffixIcon: InkWell(
                              splashColor: Colors.transparent,
                              onTap: _buttonpressed,
                              child: passHid
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  // sign in button

                  SizedBox(height: 15),

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
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                      onTap: signIn,

                    ),
                  ),

                  SizedBox(height: 10),


                  //for registration page

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a User?',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                      InkWell(
                        splashColor: Colors.white10,
                        child: Text(
                          '  Register Now',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'Register');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.white10,
                    child: Text(
                      ' Forgot Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'Forgot');
                    },
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 8,
                          thickness: 1,
                          indent: 70,
                          endIndent: 70,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),

                  //Sign up with option
                  Center(
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white54),
                    ),
                  ),
                  SizedBox(height: 10),

                  Center(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      child: google,
                      onTap: ()=> googleLogin(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _buttonpressed() {
    passHid = !passHid;
    setState(() {});
  }
}

