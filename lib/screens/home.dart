import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/drawer/collapsing_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
        ),
      );
}
