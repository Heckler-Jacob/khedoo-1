import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'drawer_screen.dart';

class AppMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), DashboardScreen()],
      ),
    );
  }
}
