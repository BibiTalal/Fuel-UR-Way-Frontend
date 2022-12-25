import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/models/drawer.dart';
import 'package:fuel_ur_way_frontend/screens/fueltype.dart';
import 'package:fuel_ur_way_frontend/screens/requestdetails.dart';
import 'package:fuel_ur_way_frontend/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:fuel_ur_way_frontend/providers/nav_provider.dart';
import 'package:fuel_ur_way_frontend/drawer/nav_model.dart';
import 'package:fuel_ur_way_frontend/screens/signin.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<AuthProvider>(context);

    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        backgroundColor: Colors.black45,
        child: Container(
          color: drawerBackgroundColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: drawerBackgroundColor,
                child: buildHeader(isCollapsed, context),
              ),
              const SizedBox(height: 24),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              const SizedBox(height: 24),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(FuelTypeScreen());
        break;
      case 1:
        // navigateTo(());
        break;
      case 2:
        navigateTo(RequestDetails());
        break;
      case 3:
        // navigateTo();
        break;
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: Colors.black45);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.black45),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed, BuildContext context) => isCollapsed
      ? CircleAvatar(radius: 10)
      : Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${context.read<AuthProvider>().username}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SigninScreen()));
                  context.read<AuthProvider>().logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        );
}
