import 'package:flutter/material.dart';
import 'package:khedoo/features_screens/chat.dart';
import 'package:khedoo/features_screens/matches_screen.dart';
import 'package:khedoo/features_screens/settings_screen.dart';
import 'package:khedoo/screens/landing_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  '/settings': (BuildContext context) => SettingsScreen(),
  '/landing': (BuildContext context) => LandingScreen(),
  '/matches': (BuildContext context) => MatchesScreen(),
  '/chat': (BuildContext context) => ChatScreen(),
};
