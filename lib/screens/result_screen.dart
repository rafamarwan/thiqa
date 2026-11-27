
import 'package:flutter/material.dart';
import 'report_screen.dart';

const resultNavy = Color(0xFF173B57);
const resultTeal = Color(0xFF238B78);
const resultBg = Color(0xFFF5F7F8);
const resultBorder = Color(0xFFDFE3EA);
const resultSecondary = Color(0xFF718096);

class ResultScreen extends StatelessWidget {
  final String identifier;
  final String identifierType;

  const ResultScreen({
    super.key,
    required this.identifier,
    required this.identifierType,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: resultBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'نتيجة الفحص',
            style: TextStyle(
              color: resultNavy,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: resultNavy,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: resultBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الجهة التي تم فحصها',
                        style: TextStyle(
                          color: resultSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        identifier,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: resultNavy,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDF1F8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'نوع المعرّف: $identifierType',
                          style: const TextStyle(
                            color: resultNavy,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF1F8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFC2C7CE),
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: resultNavy,
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'لا تتوفر بيانات تحقق فعلية حالياً',
                              style: TextStyle(
                                color: resultNavy,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'لم يتم ربط التطبيق بقاعدة بيانات البلاغات بعد. لذلك لا يمكن تأكيد موثوقية هذه الجهة أو وجود بلاغات مرتبطة بها.',
                              style: TextStyle(
                                color: Color(0xFF263746),
                                fontSize: 14,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'ملخص الفحص',
                  style: TextStyle(
                    color: resultNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                _InfoRow(
                  icon: Icons.assignment_outlined,
                  title: 'البلاغات المرتبطة',
                  value: 'غير متاح حالياً',
                ),

                const SizedBox(height: 10),

                _InfoRow(
                  icon: Icons.fact_check_outlined,
                  title: 'حالة المراجعة',
                  value: 'لم يتم التحقق',
                ),

                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: resultBorder),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تنبيه مهم',
                        style: TextStyle(
                          color: resultNavy,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'عدم ظهور بلاغات لا يعني أن الجهة موثوقة أو خالية من المخاطر. تحقّق من تفاصيل التعامل واحتفظ بإثباتات الدفع والمحادثات.',
                        style: TextStyle(
                          color: resultSecondary,
                          fontSize: 13,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.flag_outlined),
                    label: const Text(
                      'تقديم بلاغ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: resultNavy,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: resultBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: resultTeal, size: 23),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: resultNavy,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: resultSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
