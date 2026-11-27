
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

const responseNavy = Color(0xFF173B57);
const responseTeal = Color(0xFF238B78);
const responseBg = Color(0xFFF5F7F8);
const responseBorder = Color(0xFFDFE3EA);
const responseSecondary = Color(0xFF718096);

class MerchantResponseScreen extends StatefulWidget {
  const MerchantResponseScreen({super.key});

  @override
  State<MerchantResponseScreen> createState() =>
      _MerchantResponseScreenState();
}

class _MerchantResponseScreenState extends State<MerchantResponseScreen> {
  final TextEditingController _responseController =
      TextEditingController();

  String? _fileName;

  Future<void> _pickEvidence() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && mounted) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  void _submitResponse() {
    if (_responseController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى كتابة توضيح قبل الإرسال'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تم تجهيز الرد'),
        content: const Text(
          'هذا نموذج تجريبي. لم يتم إرسال الرد أو المرفقات إلى الخادم، '
          'ويجب ربطه بنظام المراجعة لاحقاً.',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _responseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: responseBg,
      appBar: AppBar(
        title: const Text(
          'الرد على البلاغ',
          style: TextStyle(
            color: responseNavy,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: responseNavy,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'تفاصيل البلاغ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: responseNavy,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: responseBorder),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(label: 'رقم البلاغ', value: '#TH-1024'),
                  Divider(height: 22),
                  _InfoRow(label: 'نوع البلاغ', value: 'مشكلة في الخدمة'),
                  Divider(height: 22),
                  _InfoRow(label: 'حالة البلاغ', value: 'بانتظار رد الجهة'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'توضيح التاجر',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: responseNavy,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'اكتب توضيحاً واضحاً حول ما ورد في البلاغ، '
              'مع ذكر أي معلومات تساعد في فهم الواقعة.',
              style: TextStyle(
                color: responseSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _responseController,
              maxLines: 6,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'اكتب ردك هنا...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: responseBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: responseBorder),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'إرفاق أدلة (اختياري)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: responseNavy,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'يمكن إرفاق صورة أو ملف PDF يدعم التوضيح.',
              style: TextStyle(color: responseSecondary),
            ),
            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: _pickEvidence,
              icon: const Icon(Icons.attach_file),
              label: const Text('اختيار ملف'),
              style: OutlinedButton.styleFrom(
                foregroundColor: responseTeal,
                side: const BorderSide(color: responseTeal),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),

            if (_fileName != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.insert_drive_file,
                      color: responseTeal),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _fileName!,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _fileName = null;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFB7791F)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'يُراجع الرد والأدلة من قبل فريق ثقة. '
                      'تقديم البلاغ لا يعني ثبوت المخالفة، '
                      'وللجهة حق الرد وتقديم ما يدعم موقفها.',
                      style: TextStyle(
                        color: Color(0xFF805B20),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submitResponse,
              style: ElevatedButton.styleFrom(
                backgroundColor: responseTeal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'إرسال الرد للمراجعة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: responseNavy,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: responseSecondary),
        ),
      ],
    );
  }
}
