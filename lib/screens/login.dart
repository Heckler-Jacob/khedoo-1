import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedoo/widgets/input_widget.dart';
import 'package:khedoo/widgets/reusable_button.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin>
    with SingleTickerProviderStateMixin {
  var tweenLeft = Tween<Offset>(begin: Offset.zero, end: Offset(-1.1, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(1.1, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));

  late AnimationController _animationController;

  var _isMoved = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height,
          // ),

          // Container(
          //   height: MediaQuery.of(context).size.height / 2.2,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [Color(0xFFfe5c4f), Color(0xFFf37520)],
          //     ),
          //   ),
          // ),

          // Logo Section
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            left: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                  scale: 7,
                ),
              ],
            ),
          ),

          // Login Screen
          SlideTransition(
            position: _animationController.drive(tweenRight),
            child:
                Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              _registerScreen(context),
            ]),
          ),
          SlideTransition(
            position: _animationController.drive(tweenLeft),
            child:
                Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              _loginScreen(context),
            ]),
          ),
        ],
      ),
    );
  }

  Positioned _registerScreen(BuildContext context) {
    return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height / 3.3,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.all(20.0),
            elevation: 0.7,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Lets make a generic input widget
                    InputWidget(
                      // topLabel: "Email",

                      hintText: "E-Mail", prefixIcon: Icons.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Khedoo",
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF8A959E)),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 0,
                    ),
                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: double.infinity, height: 44),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF000000),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ReusableButton(
                      title: "Register",
                      navigation: () {},
                      icon: Icons.ac_unit_sharp,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'By registering or signing in, you accept Khedoo privacy policy and terms of use',
                      style: GoogleFonts.openSans(
                        fontSize: 12.0,
                        color: Color.fromRGBO(64, 74, 106, 1),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),

                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: GoogleFonts.openSans(
                              fontSize: 14.0,
                              color: Color.fromRGBO(64, 74, 106, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_isMoved) {
                                _animationController.reverse();
                              } else {
                                _animationController.forward();
                              }
                              _isMoved = !_isMoved;
                            },
                            child: Text(
                              "New User",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFFf78f20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }

  Positioned _loginScreen(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 3.3,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.all(20.0),
                elevation: 0.7,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        InputWidget(
                          hintText: "Email",
                          prefixIcon: Icons.email,
                        ),
                        InputWidget(
                          hintText: "Password",
                          obscureText: true,
                          prefixIcon: Icons.password,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Not registered?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFf78f20),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ReusableButton(
                          // type: ButtonType.PRIMARY,
                          title: "Login",
                          navigation: () {}, icon: Icons.login,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Use other sign ups",
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF8A959E),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 48),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF000000),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.apple,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        'Login with Apple',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset("images/google.png"),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset("images/facebook.png"),
                            ),
                          ],
                        ),
                        Center(
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Forgot password?",
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(64, 74, 106, 1),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_isMoved) {
                                    _animationController.reverse();
                                  } else {
                                    _animationController.forward();
                                  }
                                  _isMoved = !_isMoved;
                                },
                                child: Text(
                                  "Reset it",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Color(0xFFf78f20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )));
  }
}
