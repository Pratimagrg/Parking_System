import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';
import 'package:parkingsystem/views/screens/payment/banking.dart';
import 'package:parkingsystem/views/screens/payment/wallet.dart';

class PaymentSelector extends StatelessWidget {
  const PaymentSelector({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            WalletPayment(),
            Banking(paymentType: PaymentType.eBanking),
            Banking(paymentType: PaymentType.mobileCheckout),
          ],
        ),
      ),
    );
  }
}
