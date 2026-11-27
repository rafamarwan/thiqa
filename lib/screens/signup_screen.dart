
import 'package:flutter/material.dart';
import 'otp_screen.dart';

const navy = Color(0xFF173B57);
const teal = Color(0xFF238B78);
const lightBg = Color(0xFFF5F7F8);
const borderColor = Color(0xFFDFE3EA);

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  String selectedChannel = 'WhatsApp';
  String? errorMessage;

  void submitSignup() {
    final name = nameController.text.trim();
    final phone = phoneController.text.replaceAll(' ', '').trim();

    if (name.isEmpty) {
      setState(() {
        errorMessage = 'يرجى إدخال الاسم.';
      });
      return;
    }

    if (!RegExp(r'^\d{9}$').hasMatch(phone)) {
      setState(() {
        errorMessage = 'يرجى إدخال رقم هاتف صحيح مكوّن من 9 أرقام.';
      });
      return;
    }

    setState(() {
      errorMessage = null;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          phone: phone,
          channel: selectedChannel,
          mode: 'signup',
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg,
        appBar: AppBar(
          backgroundColor: lightBg,
          foregroundColor: navy,
          elevation: 0,
          title: const Text('إنشاء حساب جديد'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),

              const Text(
                'انضم إلى مجتمع ثِقة',
                style: TextStyle(
                  color: navy,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'أنشئ حسابك باسم تعريفي بسيط ورقم هاتفك اليمني لتتمكن من إرسال البلاغات ومتابعتها. لا يُشترط الاسم الكامل أو أي بيانات هوية.',
                style: TextStyle(
                  color: Color(0xFF718096),
                  fontSize: 14,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'الاسم *',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'مثال: أبو محمد، أو الاسم الذي تفضل ظهوره',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: borderColor),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'يُستخدم للعرض فقط، ولا يُشترط الاسم الكامل أو القانوني.',
                style: TextStyle(
                  color: Color(0xFF718096),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'رقم الهاتف *',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Row(
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F8),
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('+967'),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        hintText: '77X XXX XXX',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: borderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'طريقة استلام رمز التحقق',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: channelButton('WhatsApp'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: channelButton('SMS'),
                  ),
                ],
              ),

              if (errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ),
                ),
              ],

              const SizedBox(height: 28),

              ElevatedButton(
                onPressed: submitSignup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تأكيد إنشاء الحساب',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget channelButton(String channel) {
    final selected = selectedChannel == channel;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedChannel = channel;
        });
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: selected ? teal : navy,
        backgroundColor:
            selected ? const Color(0xFFE2F4F0) : Colors.white,
        side: BorderSide(
          color: selected ? teal : borderColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        channel == 'WhatsApp' ? 'WhatsApp' : 'SMS',
      ),
    );
  }
}
