
import 'package:flutter/material.dart';

const helpNavy = Color(0xFF173B57);
const helpTeal = Color(0xFF238B78);
const helpBg = Color(0xFFF5F7F8);
const helpBorder = Color(0xFFDFE3EA);
const helpSecondary = Color(0xFF718096);

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final List<Map<String, String>> questions = const [
    {
      'question': 'كيف أفحص متجرًا أو رقم هاتف؟',
      'answer':
          'من الصفحة الرئيسية اختر نوع المعرّف، ثم أدخل رقم الهاتف أو بيانات المتجر واضغط «افحص الآن». ستظهر لك صفحة نتيجة الفحص. تذكّر أن نتائج النسخة التجريبية لا تعتمد على قاعدة بيانات فعلية.',
    },
    {
      'question': 'ماذا يعني عدم توفر بيانات؟',
      'answer':
          'يعني أن التطبيق لا يملك حاليًا بيانات تحقق كافية عن الجهة. عدم وجود بلاغات ظاهرة لا يعني أن الجهة موثوقة أو خالية من المخاطر.',
    },
    {
      'question': 'كيف أقدّم بلاغًا؟',
      'answer':
          'افتح صفحة تقديم بلاغ، واختر نوع المشكلة، واكتب وصفًا واضحًا لما حدث، ثم أرفق الأدلة المتاحة مثل إيصال التحويل أو المحادثات. لا ترفق بيانات شخصية لا تتعلق بالواقعة.',
    },
    {
      'question': 'هل يُنشر البلاغ مباشرة؟',
      'answer':
          'لا. يجب أن يخضع البلاغ للمراجعة والتحقق البشري قبل اعتماده. ويُفترض أن تتاح للجهة المبلّغ عنها فرصة الرد أو الاعتراض وفق آلية المنصة.',
    },
    {
      'question': 'ما الأدلة التي يمكن إرفاقها؟',
      'answer':
          'يمكن إرفاق صور إيصالات التحويل أو المحادثات أو صور المنتج، وكذلك ملفات PDF. تأكد من وضوح الأدلة وارتباطها بالواقعة، واحذف أو غطِّ المعلومات الشخصية غير الضرورية.',
    },
    {
      'question': 'هل رقم الهاتف الموثّق يثبت صحة البلاغ؟',
      'answer':
          'لا. التحقق من رقم الحساب يساعد في معرفة مقدم البلاغ، لكنه لا يثبت وحده صحة الواقعة. لذلك تحتاج البلاغات إلى أدلة ومراجعة مستقلة.',
    },
  ];

  void showUnavailableMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'قناة التواصل المباشر ستكون متاحة بعد ربط التطبيق بالخادم.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: helpBg,
        appBar: AppBar(
          title: const Text(
            'المساعدة والدعم',
            style: TextStyle(
              color: helpNavy,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: helpNavy,
          elevation: 0,
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
                    color: helpNavy,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.support_agent,
                        color: Colors.white,
                        size: 38,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'كيف نقدر نساعدك؟',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'تعرّف على طريقة استخدام ثقة، وفهم نتائج الفحص، وتقديم البلاغات.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  'الأسئلة الشائعة',
                  style: TextStyle(
                    color: helpNavy,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: helpBorder),
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i < questions.length; i++) ...[
                        ExpansionTile(
                          leading: const Icon(
                            Icons.help_outline,
                            color: helpTeal,
                          ),
                          iconColor: helpTeal,
                          collapsedIconColor: helpSecondary,
                          title: Text(
                            questions[i]['question']!,
                            style: const TextStyle(
                              color: helpNavy,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          childrenPadding: const EdgeInsets.fromLTRB(
                            16,
                            0,
                            16,
                            16,
                          ),
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                questions[i]['answer']!,
                                style: const TextStyle(
                                  color: helpSecondary,
                                  fontSize: 13,
                                  height: 1.9,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (i != questions.length - 1)
                          const Divider(
                            height: 1,
                            color: helpBorder,
                            indent: 16,
                            endIndent: 16,
                          ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  'إرشادات مهمة',
                  style: TextStyle(
                    color: helpNavy,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                _GuidelineCard(
                  icon: Icons.lock_outline,
                  title: 'احمِ بياناتك',
                  description:
                      'لا تشارك كلمات المرور أو رموز التحقق أو بياناتك البنكية مع أي جهة.',
                ),

                const SizedBox(height: 10),

                _GuidelineCard(
                  icon: Icons.receipt_long_outlined,
                  title: 'احتفظ بالأدلة',
                  description:
                      'احتفظ بإيصالات التحويل والمحادثات وتفاصيل الطلب عند إجراء أي تعامل.',
                ),

                const SizedBox(height: 10),

                _GuidelineCard(
                  icon: Icons.fact_check_outlined,
                  title: 'تحقّق قبل اتخاذ القرار',
                  description:
                      'اقرأ تفاصيل المعلومات المتاحة ولا تعتمد على غياب البلاغات باعتباره ضمانًا للموثوقية.',
                ),

                const SizedBox(height: 26),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: helpBorder),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.headset_mic_outlined,
                        color: helpTeal,
                        size: 34,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'تحتاج إلى مساعدة إضافية؟',
                        style: TextStyle(
                          color: helpNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'قنوات التواصل المباشر مع فريق الدعم ستُتاح بعد استكمال ربط التطبيق بالخادم.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: helpSecondary,
                          fontSize: 13,
                          height: 1.8,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              showUnavailableMessage(context),
                          icon: const Icon(Icons.support_agent),
                          label: const Text('التواصل مع الدعم'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: helpNavy,
                            side: const BorderSide(color: helpNavy),
                            padding: const EdgeInsets.symmetric(
                              vertical: 13,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'ثِقة | THIQA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: helpNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'الوعي والتحقق قبل التعامل',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: helpSecondary,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GuidelineCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _GuidelineCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: helpBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: helpTeal, size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: helpNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: helpSecondary,
                    fontSize: 12,
                    height: 1.7,
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
