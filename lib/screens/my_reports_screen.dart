
import 'package:flutter/material.dart';

const myReportsNavy = Color(0xFF173B57);
const myReportsTeal = Color(0xFF238B78);
const myReportsBg = Color(0xFFF5F7F8);
const myReportsBorder = Color(0xFFDFE3EA);
const myReportsSecondary = Color(0xFF718096);

class MyReportsScreen extends StatelessWidget {
  const MyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: myReportsBg,
        appBar: AppBar(
          title: const Text(
            'سجل البلاغات',
            style: TextStyle(
              color: myReportsNavy,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: myReportsNavy,
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
                    border: Border.all(color: myReportsBorder),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'بلاغاتي',
                        style: TextStyle(
                          color: myReportsNavy,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'يمكنك متابعة البلاغات التي قدمتها ومعرفة آخر مستجدات مراجعتها.',
                        style: TextStyle(
                          color: myReportsSecondary,
                          fontSize: 14,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: myReportsTeal,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'لا توجد بلاغات محفوظة في هذه النسخة التجريبية.',
                        style: TextStyle(
                          color: myReportsNavy,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: myReportsBorder),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.folder_open_outlined,
                        color: myReportsSecondary,
                        size: 55,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'لا توجد بلاغات بعد',
                        style: TextStyle(
                          color: myReportsNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'عند توفر خدمة حفظ البلاغات، ستظهر هنا البلاغات التي قدمتها وحالات مراجعتها.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: myReportsSecondary,
                          fontSize: 13,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'معاني حالات البلاغات',
                  style: TextStyle(
                    color: myReportsNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 14),

                _StatusItem(
                  color: const Color(0xFFD9A441),
                  title: 'قيد المراجعة',
                  description: 'البلاغ بانتظار التحقق من فريق الإشراف.',
                ),

                _StatusItem(
                  color: const Color(0xFF238B78),
                  title: 'يحتاج إلى معلومات إضافية',
                  description: 'يلزم استكمال بعض المعلومات أو الأدلة.',
                ),

                _StatusItem(
                  color: const Color(0xFFB54747),
                  title: 'مرفوض',
                  description: 'لم يستوفِ البلاغ متطلبات الاعتماد.',
                ),

                _StatusItem(
                  color: const Color(0xFF173B57),
                  title: 'تمت المراجعة',
                  description: 'انتهت مراجعة البلاغ واتُّخذ بشأنه قرار.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const _StatusItem({
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: myReportsBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 11,
            height: 11,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: myReportsSecondary,
                    fontSize: 12,
                    height: 1.6,
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
