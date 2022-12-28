import 'dart:async';
import 'package:fuel_ur_way_frontend/models/order.dart';
import 'package:fuel_ur_way_frontend/models/home_model.dart';

class HomeViewModel {
  List<Homemodel> items = [];
  List<Homemodel> basketItems = [];
  double totalPrice = 0;
  bool isLoading = true;

  // Product count increment
  void incrementCount(Homemodel model) {
    // model.isOpen = true;
    //model.count++;
    totalMoney(model);
    if (!basketItems.contains(model)) {
      basketItems.add(model);
    }
    //setState();
  }

  // Product count deincrement
  void deIncrementCount(Homemodel model) {
    if (model.count != 0) {
      model.count;
      //totalMoney(model.price!);
      if (model.count! > 1) {
        basketItems.remove(model);
      }
      // setState();
    }
    model.count == 0 ? model.isOpen = false : null;
  }

  // Calculate total money
  void totalMoney(Homemodel model) {
    if (model.price != null) {
      totalPrice = items.fold(
          0,
          (previousValue, element) =>
              previousValue + element.price! * element.count!);
      model.price = model.price! * model.count!;
      //setState();
    }
  }

  // Method that makes data come animatically
  void loadPage() {
    isLoading = false;
    //setState();
  }
}
