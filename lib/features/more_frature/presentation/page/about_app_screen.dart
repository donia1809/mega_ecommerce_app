import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
Welcome to Mega.

By accessing or using our application or website, you agree to be bound by these Terms & Conditions. If you do not agree, please do not use our services.

1. Definitions
“App” refers to [ Mega Ecommerce App ].
“User” refers to any person using the App.
“Products” refers to goods or services offered through the App.
“We”, “Us”, “Our” refers to [Company Name].

2. Eligibility
You must be at least 18 years old or have legal parental/guardian consent to use this App.

3. Account Registration
Users may be required to create an account.
You are responsible for maintaining the confidentiality of your login information.
You agree to provide accurate and complete information.

4. Products & Pricing
All product descriptions and prices are subject to change without notice.
We strive for accuracy but do not guarantee that product descriptions or prices are error-free.
In case of an error, we reserve the right to cancel or refuse orders.

5. Orders & Payments
Orders are subject to availability and confirmation.
Payment must be completed before order processing.
Accepted payment methods will be displayed within the App.
We reserve the right to refuse or cancel any order.
''',
          style: TextStyle(fontSize: 16),
          softWrap: true,
        ),
      ),
    );
  }
}
