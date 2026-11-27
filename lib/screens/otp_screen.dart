import 'home_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String channel;
  final String mode;

  const OtpScreen({
    super.key,
    required this.phone,
    required this.channel,
    required this.mode,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  void verifyOtp() {
  if (otpController.text.trim() == '123456') {
    Navigator.pushAndRemoveUntil(
      context,
     MaterialPageRoute(
  builder: (context) => const HomeScreen(),
),
      (route) => false,
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('رمز التحقق غير صحيح. جرّب 123456'),
      ),
    );
  }
}

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F8),
        appBar: AppBar(
          title: const Text('التحقق من رقم الهاتف'),
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF173B57),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Text(
                'أدخل رمز التحقق',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173B57),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'أدخل الرمز التجريبي المكوّن من 6 أرقام للمتابعة.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'أدخل الرمز',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF173B57),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('تحقق'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
