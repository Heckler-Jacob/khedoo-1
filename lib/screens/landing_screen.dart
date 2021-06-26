import 'package:flutter/material.dart';

import 'app_main_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    void _handleAuth() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AppMainScreen()));
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xffFFF5B7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )),
          ),
          Positioned(
            top: 300,
            right: -45,
            child: FloaterWidget(
              color: Color(0xff66DE93),
            ),
          ),
          Positioned(
            top: 100,
            left: -45,
            child: FloaterWidget(color: Color(0xffFFEAC9).withOpacity(0.9)),
          ),
          Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: _handleAuth,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Login with Google'),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: _handleAuth,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Login with Email'),
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: _handleAuth,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Login with Facebook'),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class FloaterWidget extends StatelessWidget {
  final Color color;

  const FloaterWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(180.0),
          )),
    );
  }
}
