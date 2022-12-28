import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/screens/requestdetails.dart';
import 'package:fuel_ur_way_frontend/screens/saved_vehicles.dart';
import 'package:fuel_ur_way_frontend/widgets/mainscreenwidget.dart';

class DrawerServices {
  Widget drawerScreen(title) {
    if (title == 'Home') {
      return MainScreenWidget();
    }
    if (title == 'Upcoming Services') {
      return RequestDetails();
    }
    if (title == 'Saved Vehicles') {
      return Saved();
    }

    if (title == 'Loyalty Points') {
      return RequestDetails();
    }

    return MainScreenWidget();
  }
}
