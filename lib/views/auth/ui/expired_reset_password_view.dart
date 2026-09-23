import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpiredResetLinkScreen extends StatelessWidget {
  const ExpiredResetLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This password reset link is '
              'invalid or has expired.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            CustomEBtn(
              text: Text(
                "Request New Link",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
              width: double.infinity,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
