
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

const editNavy = Color(0xFF173B57);
const editTeal = Color(0xFF238B78);
const editBg = Color(0xFFF5F7F8);
const editBorder = Color(0xFFDFE3EA);

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController(
    text: 'مستخدم ثقة',
  );

  Uint8List? selectedImage;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  
Future<void> pickImage() async {
  try {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result == null) return;

    final bytes = result.files.single.bytes;

    if (bytes == null) {
      throw Exception('تعذر قراءة الصورة');
    }

    setState(() {
      selectedImage = bytes;
    });
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تعذر اختيار الصورة. حاول مرة أخرى.'),
      ),
    );
  }
}

  void saveProfile() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال الاسم.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تنبيه'),
        content: const Text(
          'تم التحقق من البيانات المدخلة. '
          'لكن حفظ التعديلات بشكل دائم يحتاج إلى ربط التطبيق بالخادم.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: editBg,
        appBar: AppBar(
          title: const Text(
            'تعديل الملف الشخصي',
            style: TextStyle(
              color: editNavy,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: editNavy),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor:
                                const Color(0xFFE2F4F0),
                            backgroundImage: selectedImage != null
                                ? MemoryImage(selectedImage!)
                                : null,
                            child: selectedImage == null
                                ? const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: editTeal,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: InkWell(
                              onTap: pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                decoration: const BoxDecoration(
                                  color: editTeal,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: pickImage,
                        child: const Text(
                          'تغيير الصورة الشخصية',
                          style: TextStyle(
                            color: editTeal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: editBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الاسم',
                        style: TextStyle(
                          color: editNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          hintText: 'أدخل الاسم',
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: editTeal,
                          ),
                          filled: true,
                          fillColor: editBg,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: editBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: editBorder,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          color: editNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'غير متصل بحساب حقيقي حالياً',
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
                            color: editTeal,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF0F2F4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: editBorder,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'يمكن تحديث رقم الهاتف بعد ربط خدمة التحقق.',
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: editNavy,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'حفظ التعديلات',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
