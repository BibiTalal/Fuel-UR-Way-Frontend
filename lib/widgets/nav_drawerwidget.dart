import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fuel_ur_way_frontend/providers/auth.dart';
import 'package:fuel_ur_way_frontend/providers/nav_provider.dart';
import 'package:fuel_ur_way_frontend/screens/signin.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';

class MenuWidget extends StatelessWidget {
  String username;
  final Function(String)? onItemClick;
  MenuWidget({required this.username, this.onItemClick});
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
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              sliderItem('Home', Icons.home),
              sliderItem('Upcoming Services', Icons.notifications),
              sliderItem('Saved Vehicles', Icons.turned_in),
              sliderItem('Loyalty Points', Icons.star),
              const SizedBox(height: 24),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
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

  Widget sliderItem(String title, IconData icons) => InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  icons,
                  color: Colors.black45,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        onItemClick!(title);
        print(title);
      });

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
              username,
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
