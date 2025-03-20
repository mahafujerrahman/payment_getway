import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payment_getway/uddoktaPay/customerModel.dart';

class PaymentService {
  final String apiKey = '982d381360a69d419689740d9f2e26ce36fb7a50';
  final String apiUrl = 'https://sandbox.uddoktapay.com/api/checkout-v2';

  Future<void> initiatePayment({
    required BuildContext context,
    required double amount,
    required CustomerInfo customer,
  }) async {
    try {

      final requestBody = {
        'customer': customer.toJson(),
        'amount': amount.toString(),
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Payment initiation successful: $responseData');
        if (responseData['status'] == 'success') {
          print('Payment initiated, transaction ID: ${responseData['transaction_id']}');
        } else {
          print('Payment failed: ${responseData['message']}');
        }
      } else {
        print('Failed to initiate payment. Status Code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error initiating payment: $e');
    }
  }
}
