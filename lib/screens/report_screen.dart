
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'report_confirmation_screen.dart';

const reportNavy = Color(0xFF173B57);
const reportTeal = Color(0xFF238B78);
const reportBg = Color(0xFFF5F7F8);
const reportBorder = Color(0xFFDFE3EA);

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final descriptionController = TextEditingController();
  final otherReasonController = TextEditingController();
  final amountController = TextEditingController();

  String selectedType = 'عدم تسليم الطلب بعد التحويل';
  DateTime? incidentDate;

  List<PlatformFile> attachedFiles = [];

  final reportTypes = [
    'عدم تسليم الطلب بعد التحويل',
    'احتيال في الدفع أو المحفظة',
    'منتج مغشوش أو مختلف عن المتفق عليه',
    'انتحال صفة متجر أو جهة معروفة',
    'أخرى',
  ];

  Future<void> selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('ar'),
    );

    if (picked != null) {
      setState(() {
        incidentDate = picked;
      });
    }
  }

  Future<void> pickEvidenceFiles() async {
    try {
     final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: true,
        withData: true,
      );

      if (result == null) return;

      List<PlatformFile> validFiles = [];
      List<String> rejectedFiles = [];

      for (final file in result.files) {
        if (file.size > 5 * 1024 * 1024) {
          rejectedFiles.add('${file.name}: يتجاوز 5 ميجابايت');
        } else if (file.bytes == null) {
          rejectedFiles.add('${file.name}: تعذرت قراءة الملف');
        } else {
          validFiles.add(file);
        }
      }

      if (!mounted) return;

      setState(() {
        for (final file in validFiles) {
          if (!attachedFiles.any(
            (item) => item.name == file.name,
          )) {
            attachedFiles.add(file);
          }
        }
      });

      if (rejectedFiles.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'لم تتم إضافة بعض الملفات:\n${rejectedFiles.join('\n')}',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ أثناء اختيار الملفات.'),
        ),
      );
    }
  }

  void submitReport() {
  if (descriptionController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('يرجى كتابة وصف واضح للواقعة.'),
      ),
    );
    return;
  }

  if (selectedType == 'أخرى' &&
      otherReasonController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('يرجى توضيح نوع البلاغ عند اختيار أخرى.'),
      ),
    );
    return;
  }

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('تأكيد إرسال البلاغ'),
      content: const Text(
        'هل تريد المتابعة إلى شاشة تأكيد البلاغ؟ '
        'تذكّر أن هذه نسخة تجريبية، ولن تُرسل البيانات فعليًا إلى الخادم.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(dialogContext);
          },
          child: const Text('تراجع'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(dialogContext);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ReportConfirmationScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: reportNavy,
            foregroundColor: Colors.white,
          ),
          child: const Text('تأكيد'),
        ),
      ],
    ),
  );
}

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: reportBg,
        appBar: AppBar(
          title: const Text('تقديم بلاغ'),
          backgroundColor: Colors.white,
          foregroundColor: reportNavy,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // بيانات مقدم البلاغ
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2F4F0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.verified_user,
                      color: reportTeal,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'بيانات مقدم البلاغ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: reportNavy,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ستُعرض بيانات الحساب هنا بعد الربط.',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // الجهة المبلّغ عنها
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: reportBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الجهة المبلّغ عنها',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ستُعبّأ بيانات الجهة من نتيجة الفحص.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: reportNavy,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'نوع البلاغ *',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
               initialValue: selectedType,
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: reportBorder),
                  ),
                ),
                items: reportTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(
                      type,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedType = value;
                    });
                  }
                },
              ),

              if (selectedType == 'أخرى') ...[
                const SizedBox(height: 16),

                const Text(
                  'يرجى توضيح نوع البلاغ *',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: otherReasonController,
                  maxLines: 2,
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: 'ما نوع المشكلة التي تريد الإبلاغ عنها؟',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: reportBorder,
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              const Text(
                'وصف تفصيلي لما حدث *',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'اشرح باختصار كيفية التعامل وما حدث...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: reportBorder),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'تاريخ الواقعة (اختياري)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              OutlinedButton.icon(
                onPressed: selectDate,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  incidentDate == null
                      ? 'اختر تاريخ الواقعة'
                      : '${incidentDate!.year}/${incidentDate!.month}/${incidentDate!.day}',
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: reportNavy,
                  padding: const EdgeInsets.all(14),
                  alignment: Alignment.centerRight,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'المبلغ المالي (اختياري)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'مثال: 45000',
                  suffixText: 'ريال يمني',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: reportBorder),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // إرفاق الأدلة
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: reportBorder,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 40,
                      color: reportNavy,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'إرفاق الأدلة',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: reportNavy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'يمكن إرفاق صور إيصالات التحويل أو المحادثات.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    OutlinedButton.icon(
                      onPressed: pickEvidenceFiles,
                      icon: const Icon(Icons.upload_file),
                      label: const Text('اختيار الملفات'),
                    ),

                    if (attachedFiles.isNotEmpty) ...[
                      const SizedBox(height: 12),

                      ...attachedFiles.map((file) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: reportBg,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: reportBorder),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                file.extension?.toLowerCase() == 'pdf'
                                    ? Icons.picture_as_pdf
                                    : Icons.image_outlined,
                                color: reportTeal,
                              ),
                              const SizedBox(width: 8),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      file.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      '${(file.size / 1024).toStringAsFixed(1)} KB',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    attachedFiles.remove(file);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                tooltip: 'حذف الملف',
                              ),
                            ],
                          ),
                        );
                      }),
                    ],

                    const SizedBox(height: 8),
                    const Text(
                      'الصيغ المقبولة: JPG, PNG, PDF — الحد الأقصى 5 ميجابايت للملف.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              ElevatedButton.icon(
                onPressed: submitReport,
                icon: const Icon(Icons.send),
                label: const Text('تأكيد إرسال البلاغ'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: reportNavy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
