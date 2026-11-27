
import 'package:flutter/material.dart';
import 'home_screen.dart';

const confirmationNavy = Color(0xFF173B57);
const confirmationTeal = Color(0xFF238B78);
const confirmationBg = Color(0xFFF5F7F8);

class ReportConfirmationScreen extends StatelessWidget {
  const ReportConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: confirmationBg,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 35),

                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2F4F0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: confirmationTeal.withValues(alpha: 0.25),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.assignment_turned_in_outlined,
                      color: confirmationTeal,
                      size: 52,
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'تم تأكيد النموذج بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: confirmationNavy,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'وصلت إلى نهاية خطوات تقديم البلاغ في النسخة التجريبية من تطبيق ثقة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF718096),
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 28),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5DF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE8D29C),
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Color(0xFF9A6B16),
                          size: 26,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تنبيه: النسخة التجريبية',
                                style: TextStyle(
                                  color: Color(0xFF805A16),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'لم يتم إرسال بيانات البلاغ أو المرفقات إلى الخادم، ولم تصل إلى فريق الإشراف. سيصبح الإرسال الفعلي متاحًا بعد ربط التطبيق بالخادم الخلفي.',
                                style: TextStyle(
                                  color: Color(0xFF765F36),
                                  fontSize: 13,
                                  height: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFDFE3EA),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          color: confirmationTeal,
                          size: 32,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'في ثقة، نراجع البلاغات قبل اعتمادها',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: confirmationNavy,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'يهدف نظام المراجعة إلى التحقق من المعلومات وحماية حقوق المستهلكين وأصحاب المتاجر.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF718096),
                            fontSize: 13,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home_outlined),
                      label: const Text(
                        'العودة إلى الرئيسية',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: confirmationNavy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
