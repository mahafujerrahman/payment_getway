import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:payment_getway/uddoktaPay/customCard.dart';
import 'package:payment_getway/uddoktaPay/customerModel.dart';
import 'package:payment_getway/uddoktaPay/paymentSearvice.dart';
import 'package:uddoktapay/models/customer_model.dart';  // Ensure correct import

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double totalPrice = 100.00;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Gateway Payment', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              initiateUddoktaPayment(context);
              print('Click');
            },
            child: CustomCard(
              text: 'Uddokta Payment',
              icon: Icons.payment,
            ),
          ),
        ],
      ),
    );
  }

  void initiateUddoktaPayment(BuildContext context) {
    final customer = CustomerInfo(
      fullName: 'Mahafujer Rahman',
      email: 'mahafuj@gmail.com',
    );

    PaymentService().initiatePayment(
      context: context,
      customer: customer,
      amount: totalPrice,
    );
  }
}
