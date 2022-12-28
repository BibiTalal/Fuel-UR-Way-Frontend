import 'package:flutter_slider_drawer_v/flutter_slider_drawer_v.dart';
import 'package:fuel_ur_way_frontend/drawer/drawer_services.dart';
import 'package:fuel_ur_way_frontend/widgets/nav_drawerwidget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fuel_ur_way_frontend/models/home_view_model.dart';
import 'package:fuel_ur_way_frontend/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/theme.dart';

class MainScreen extends StatefulWidget {
  String? username;
  MainScreen({this.username});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DrawerServices _services = DrawerServices();
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();
  String? title;

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    widget.username;
    String totalMoney = '\$ ${viewModel.totalPrice}';
    return Scaffold(
      body: SliderMenuContainer(
          appBarColor: Colors.white,
          key: _key,
          appBarPadding: const EdgeInsets.only(top: 20),
          sliderMenuOpenSize: 260,
          appBarHeight: 70,
          title: Padding(
            padding: EdgeInsets.fromLTRB(200, 20, 0, 0),
            child: ActionChip(
              label: PrimaryBoldText(context: context, data: totalMoney),
              avatar: PrimaryIcon(icon: Icons.shopping_bag, context: context),
              onPressed: () => _showModalBottomSheet(context, viewModel),
            ),
          ),
          sliderMenu: MenuWidget(
            onItemClick: (title) {
              _key.currentState!.closeDrawer();
              setState(() {
                this.title = title;
              });
            },
            username: widget.username!,
          ),
          sliderMain: Center(child: _services.drawerScreen(title))),
    );
  }

  void _showModalBottomSheet(BuildContext context, HomeViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: drawerBackgroundColor,
      builder: (context) => viewModel.basketItems.isEmpty
          ? _emptyBasket(context)
          : StatefulBuilder(builder: (context, StateSetter setState) {
              return _basketItems(context, viewModel, setState);
            }),
    );
  }

  FlipInY _emptyBasket(BuildContext context) => FlipInY(
        child: Center(
          child: Padding(
            padding: context.paddingLow,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                PrimaryIcon(icon: Icons.shopping_cart, context: context),
                context.emptySizedWidthBoxLow3x,
                Text(
                  'Your basket is currently empty.',
                  style: TextStyle(
                      color: context.secondaryVariant,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
  ListView _basketItems(BuildContext context, HomeViewModel viewModel,
          StateSetter setState) =>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: context.paddingMedium,
        itemBuilder: (context, index) =>
            _basketItem(context, viewModel, index, setState),
        separatorBuilder: (context, index) => context.emptySizedHeightBoxLow,
        itemCount: viewModel.basketItems.length,
      );

  JelloIn _basketItem(BuildContext context, HomeViewModel viewModel, int index,
          StateSetter setState) =>
      JelloIn(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          child: Padding(
            padding: context.paddingLow,
            child: ListTile(
              leading: Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                //child: Image(image: AssetImage(images[index]),),
              ),
              title: CarName(
                data:
                    viewModel.basketItems[index].fuelType ?? 'Title is null !',
              ),

              // _priceCountAndButtons(context, viewModel, index, setState),
            ),
          ),
        ),
      );
}
