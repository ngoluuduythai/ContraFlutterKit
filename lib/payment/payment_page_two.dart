import 'package:contraflutterkit/custom_widgets/button_plain_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/custom_app_bar.dart';
import 'package:contraflutterkit/login/login_text.dart';
import 'package:contraflutterkit/payment/payment_card_item_big.dart';
import 'package:contraflutterkit/payment/payment_type.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPageTwo extends StatefulWidget {
  @override
  _PaymentPageTwoState createState() => _PaymentPageTwoState();
}

class _PaymentPageTwoState extends State<PaymentPageTwo>
    with SingleTickerProviderStateMixin {
  List<PaymentType> types = List<PaymentType>();
  List<String> list = List<String>();
  AnimationController controller;
  bool isVertical = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    list.add("Get 24x7 Support");
    list.add("120+ Screens");
    list.add("120+ Screens");
    types.add(PaymentType(type: "POPULAR", list: list, color: flamingo));
    types.add(PaymentType(
        price: "34", type: "TRENDING", list: list, color: Colors.yellow));
    types.add(
        PaymentType(price: "34", type: "POPULAR", list: list, color: flamingo));
    controller = AnimationController(
        reverseDuration: Duration(milliseconds: 300),
        duration: const Duration(milliseconds: 200),
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  void onChecked(bool val) {
    setState(() {
      isChecked = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonRoundWithShadow(
                          size: 48,
                          borderColor: wood_smoke,
                          color: white,
                          callback: () {
                            Navigator.pop(context);
                          },
                          shadowColor: wood_smoke,
                          iconPath: "assets/icons/arrow_back.svg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: LoginText(
                    size: 27,
                    alignment: Alignment.bottomCenter,
                    text: "Payments",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_arrow,
                    progress: controller,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                reverse: false,
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  return PaymentCartItemBig(
                    type: types[index],
                  );
                }),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    onChanged: onChecked,
                    value: isChecked,
                  ),
                  Expanded(
                    child: Text(
                      "I read. Please read following terms and condition if you want to go further. Otherwise we will not give you any refund.",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonPlainWithShadow(
                text: "Subscribe now",
                height: 48,
                shadowColor: persian_blue,
                color: persian_blue,
                callback: () {},
                textColor: white,
                borderColor: persian_blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
