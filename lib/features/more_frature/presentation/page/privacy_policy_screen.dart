import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.privacyPolicy)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
Privacy Policy for Mega
Last updated: [Insert date]

Welcome to Mega. Your privacy is important to us, and this Privacy Policy explains how we collect, use, disclose, and protect your information when you use the Mega mobile application or related services.

By using Mega, you agree to the practices described in this Privacy Policy.

1. Information We Collect
1.1 Personal Information
We may collect personal information that you provide directly, such as:
- Name
- Email address
- Phone number
- Account credentials
- Profile information

1.2 Usage Information
We may automatically collect:
- App usage data
- Device information (model, OS version)
- Log data (IP address, crash logs, performance data)

1.3 Transaction Information
If you make purchases through Mega, we may collect:
- Order details
- Payment status
(Note: Payment details are processed securely by third-party payment providers; we do not store card details.)
''',
          style: TextStyle(fontSize: 16),
          softWrap: true,
        ),
      ),
    );
  }
}
