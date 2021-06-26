import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff1A1C20);
List<BoxShadow> shadowList = [
  BoxShadow(color: Color(0xffFAF1E6), blurRadius: 30, offset: Offset(0, 10))
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.user, 'title': 'Profile', 'route': 'settings'},
  {'icon': Icons.chat, 'title': 'Chats', 'route': 'chat'},
  {'icon': Icons.mail, 'title': 'Matches', 'route': 'matches'},
  {'icon': FontAwesomeIcons.userAlt, 'title': 'About', 'route': 'chat'},
  {'icon': FontAwesomeIcons.plus, 'title': 'Upgrade', 'route': 'settings'},
];
