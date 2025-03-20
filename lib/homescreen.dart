import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:payment_getway/uddoktaPay/customCard.dart';
import 'package:uddoktapay/models/customer_model.dart';
import 'package:uddoktapay/models/request_response.dart';
import 'package:uddoktapay/uddoktapay.dart';

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
              uddoktaPay();
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

  void uddoktaPay() async {
    final response =await UddoktaPay.createPayment(
      context: Get.context!,
      customer: CustomerDetails(fullName: 'Mahafujer Rahman', email: 'mahafuj@gmail.com'),
      amount: totalPrice.toString()
    );
    if (response.status == ResponseStatus.completed){
      print ('Payment completed, Trx Id - ${response.transactionId}');
      print (response.senderNumber);
    }
    if (response.status == ResponseStatus.canceled){
      print ('Payment canceled');
    }
    if (response.status == ResponseStatus.pending){
      print ('Payment pending');
    }
  }



}
