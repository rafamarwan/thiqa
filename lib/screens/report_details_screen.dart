
import 'package:flutter/material.dart';

const detailsNavy = Color(0xFF173B57);
const detailsTeal = Color(0xFF238B78);
const detailsBg = Color(0xFFF5F7F8);
const detailsBorder = Color(0xFFDFE3EA);
const detailsSecondary = Color(0xFF718096);

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: detailsBg,
        appBar: AppBar(
          title: const Text(
            'تفاصيل البلاغ',
            style: TextStyle(
              color: detailsNavy,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: detailsNavy,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: detailsBorder),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'رقم البلاغ',
                        style: TextStyle(
                          color: detailsSecondary,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'يُحدد بعد تسجيل البلاغ',
                        style: TextStyle(
                          color: detailsNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 16),
                      _StatusBadge(),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'معلومات البلاغ',
                  style: TextStyle(
                    color: detailsNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const _DetailCard(
                  title: 'الجهة المبلّغ عنها',
                  value: 'لا توجد بيانات مرتبطة بعد',
                  icon: Icons.storefront_outlined,
                ),

                const _DetailCard(
                  title: 'نوع البلاغ',
                  value: 'لا توجد بيانات محفوظة',
                  icon: Icons.category_outlined,
                ),

                const _DetailCard(
                  title: 'تاريخ تقديم البلاغ',
                  value: 'غير متاح في النسخة التجريبية',
                  icon: Icons.calendar_month_outlined,
                ),

                const _DetailCard(
                  title: 'وصف الواقعة',
                  value: 'سيظهر وصف البلاغ بعد ربط قاعدة البيانات.',
                  icon: Icons.description_outlined,
                ),

                const SizedBox(height: 22),

                const Text(
                  'سجل المراجعة',
                  style: TextStyle(
                    color: detailsNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: detailsBorder),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.history,
                        color: detailsTeal,
                        size: 34,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'لا يوجد سجل مراجعة متاح',
                        style: TextStyle(
                          color: detailsNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'ستظهر هنا تحديثات حالة البلاغ وملاحظات فريق المراجعة بعد ربط النظام.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: detailsSecondary,
                          fontSize: 13,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF5DF),
                    borderRadius: BorderRadius.circular(12),
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
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'هذه واجهة توضيحية فقط. لا يوجد بلاغ فعلي أو قرار مراجعة محفوظ حاليًا.',
                          style: TextStyle(
                            color: Color(0xFF765F36),
                            fontSize: 13,
                            height: 1.8,
                          ),
                        ),
                      ),
                    ],
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

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5DF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.schedule,
            color: Color(0xFF9A6B16),
            size: 17,
          ),
          SizedBox(width: 6),
          Text(
            'حالة توضيحية',
            style: TextStyle(
              color: Color(0xFF9A6B16),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _DetailCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: detailsBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: detailsTeal, size: 23),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: detailsSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: detailsNavy,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


