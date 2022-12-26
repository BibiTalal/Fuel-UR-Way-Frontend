import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/screens/lastpage.dart';
import 'package:fuel_ur_way_frontend/style/color.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class EndScreen extends StatefulWidget {
  var Payment;
  int? Amount = 200;
  EndScreen({this.Payment, this.Amount});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  Razorpay? razorpay;
  TextEditingController AmountController = new TextEditingController();
  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay!.clear();
  }

  void openCheckout() {
    var options = {
      "key": "[YOUR_API_KEY]",
      "amount": num.parse(AmountController.text) * 100,
      "name": "Fuel App App",
      "description": "Payment for the Service",
      "prefill": {"contact": "222222222", "email": "BIBI@gmail.com"},
      "external": {
        "Visa": ["Visa"],
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success");
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LastScreen()));
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show(
      "Pament error",
    );
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show(
      "External Wallet",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay Tutorial"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text("${widget.Amount}"),
            TextField(
              autofocus: false,
              controller: AmountController,
              decoration: InputDecoration(hintText: "amount to pay"),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              // color: Colors.blue,
              child: Text(
                'Authrise payment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(buttonColor),
              ),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
