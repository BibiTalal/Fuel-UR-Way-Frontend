import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/providers/order_provider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:intl/intl.dart';
import 'package:fuel_ur_way_frontend/screens/lastpage.dart';

class PaymentScreen extends StatefulWidget {
  String? fueltype;
  String? Username;
  String? carname;
  String? Fuel_Quantity;
  int? Amount;
  var Payment;
  DateTime? time;
  DateTime? date;
  String? Address;
  String? extraService;
  double? total;
  OutlineInputBorder? border;

  PaymentScreen(
      {this.fueltype,
      this.carname,
      this.Fuel_Quantity,
      this.Payment,
      this.Address,
      this.total,
      this.date,
      this.time,
      this.extraService});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  String formattedTime = DateFormat.Hms().format(now);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //card informatiom
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  @override
  void initState() {
    super.initState();
    final request = Provider.of<OrderProvider>(context, listen: false);
    request.getorderData();
  }

  @override
  Widget build(BuildContext context) {
    final requestModel = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                child: Container(
                  width: double.infinity,
                  height: 1000,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.blue),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('assets/images/card.png'),
                          fit: BoxFit.cover,
                          width: 80,
                          height: 70,
                        ),
                      ),
                      Divider(
                        thickness: 2, // thickness of the line
                        indent:
                            20, // empty space to the leading edge of divider.
                        endIndent:
                            20, // empty space to the trailing edge of the divider.
                        color: Colors
                            .black, // The color to use when painting the line.
                        height: 20,
                      ),
                      Text('Time of order:${formattedTime}-${formatted}'),
                      Text('Request Information'),
                      Divider(
                        thickness: 2, // thickness of the line
                        indent:
                            20, // empty space to the leading edge of divider.
                        endIndent:
                            20, // empty space to the trailing edge of the divider.
                        color: Colors
                            .black, // The color to use when painting the line.
                        height: 20,
                      ),
                      Text('User Name: ${widget.Username}'),
                      Text('Car Type: ${widget.carname}'),
                      Text('Fuel Type: ${widget.fueltype}'),
                      Text('Quantity: ${widget.Fuel_Quantity}'),
                      Text('extraService: ${widget.extraService}'),
                      Text('Addresses: ${widget.Address}'),
                      Text(
                          'Register an appointment:\n ${widget.time}/${widget.date}'),
                      Text('Total: ${widget.total}'),
                      Text('Payment Information'),
                      Divider(
                        thickness: 2, // thickness of the line
                        indent:
                            20, // empty space to the leading edge of divider.
                        endIndent:
                            20, // empty space to the trailing edge of the divider.
                        color: Colors
                            .black, // The color to use when painting the line.
                        height: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 30,
                            ),
                            CreditCardWidget(
                              glassmorphismConfig: useGlassMorphism
                                  ? Glassmorphism.defaultConfig()
                                  : null,
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                              bankName: 'Kuawit Bank',
                              showBackView: isCvvFocused,
                              obscureCardNumber: true,
                              obscureCardCvv: true,
                              isHolderNameVisible: true,
                              cardBgColor: Colors.red,
                              backgroundImage: useBackgroundImage
                                  ? 'assets/images/card.png'
                                  : null,
                              isSwipeGestureEnabled: true,
                              onCreditCardWidgetChange:
                                  (CreditCardBrand creditCardBrand) {},
                              customCardTypeIcons: <CustomCardTypeIcon>[
                                CustomCardTypeIcon(
                                  cardType: CardType.mastercard,
                                  cardImage: Image.asset(
                                    'assets/images/card.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    CreditCardForm(
                                      formKey: formKey,
                                      obscureCvv: true,
                                      obscureNumber: true,
                                      cardNumber: cardNumber,
                                      cvvCode: cvvCode,
                                      isHolderNameVisible: true,
                                      isCardNumberVisible: true,
                                      isExpiryDateVisible: true,
                                      cardHolderName: cardHolderName,
                                      expiryDate: expiryDate,
                                      themeColor: Colors.blue,
                                      textColor: Colors.black45,
                                      cardNumberDecoration: InputDecoration(
                                        labelText: 'Number',
                                        hintText: 'XXXX XXXX XXXX XXXX',
                                        hintStyle: const TextStyle(
                                            color: Colors.black45),
                                        labelStyle: const TextStyle(
                                            color: Colors.black45),
                                        focusedBorder: widget.border,
                                        enabledBorder: widget.border,
                                      ),
                                      expiryDateDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black45),
                                        labelStyle: const TextStyle(
                                            color: Colors.black45),
                                        focusedBorder: widget.border,
                                        enabledBorder: widget.border,
                                        labelText: 'Expired Date',
                                        hintText: 'XX/XX',
                                      ),
                                      cvvCodeDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black45),
                                        labelStyle: const TextStyle(
                                            color: Colors.black45),
                                        focusedBorder: widget.border,
                                        enabledBorder: widget.border,
                                        labelText: 'CVV',
                                        hintText: 'XXX',
                                      ),
                                      cardHolderDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black45),
                                        labelStyle: const TextStyle(
                                            color: Colors.black45),
                                        focusedBorder: widget.border,
                                        enabledBorder: widget.border,
                                        labelText: 'Card Holder',
                                      ),
                                      onCreditCardModelChange:
                                          onCreditCardModelChange,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          'Glassmorphism',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Switch(
                                          value: useGlassMorphism,
                                          inactiveTrackColor: Colors.grey,
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.green,
                                          onChanged: (bool value) =>
                                              setState(() {
                                            useGlassMorphism = value;
                                          }),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          'Card Image',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Switch(
                                          value: useBackgroundImage,
                                          inactiveTrackColor: Colors.grey,
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.green,
                                          onChanged: (bool value) =>
                                              setState(() {
                                            useBackgroundImage = value;
                                          }),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        backgroundColor:
                                            const Color(0xff1b447b),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.all(12),
                                        child: const Text(
                                          'Validate',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'halter',
                                            fontSize: 14,
                                            package: 'flutter_credit_card',
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          print('valid!');
                                        } else {
                                          print('invalid!');
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              requestModel.postData(
                                user: widget.Username!,
                                carType: widget.carname!,
                                fuelType: widget.fueltype!,
                                litter: widget.Fuel_Quantity!,
                                address: widget.Address!,
                                date: widget.date!,
                                time: widget.time!,
                                price: widget.total!.toString(),
                                payed: widget.Payment,
                              );
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => LastScreen()));
                            },
                            child: Text(
                              'Authrise payment',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
