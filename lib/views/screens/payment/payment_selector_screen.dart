import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';
import 'package:parkingsystem/views/screens/payment/banking.dart';
import 'package:parkingsystem/views/screens/payment/wallet.dart';

class PaymentSelector extends StatelessWidget {
  const PaymentSelector({Key? key, required this.vehicleOut}) : super(key: key);

  final dynamic vehicleOut;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Wallet Payment'),
              Tab(text: 'EBanking'),
              Tab(text: 'MBanking'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WalletPayment(vehicleOut: vehicleOut),
            const Banking(paymentType: PaymentType.eBanking),
            const Banking(paymentType: PaymentType.mobileCheckout),
          ],
        ),
      ),
    );
  }
}
