import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final title;
  final Function navigation;
  final IconData icon;

  const ReusableButton(
      {this.title, required this.navigation, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff346751),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  textStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
              label: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffdbf6e9),
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onPressed: () {
                navigation();
              },
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
