
import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

const profileNavy = Color(0xFF173B57);
const profileTeal = Color(0xFF238B78);
const profileBg = Color(0xFFF5F7F8);
const profileBorder = Color(0xFFDFE3EA);
const profileSecondary = Color(0xFF718096);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: profileBg,
        appBar: AppBar(
          title: const Text(
            'الملف الشخصي',
            style: TextStyle(
              color: profileNavy,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: profileNavy,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: profileBorder),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: const Color(0xFFE7F1EF),
                        child: const Icon(
                          Icons.person_outline,
                          size: 48,
                          color: profileTeal,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'مستخدم ثقة',
                        style: TextStyle(
                          color: profileNavy,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'بيانات الحساب غير متصلة حاليًا',
                        style: TextStyle(
                          color: profileSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7F1EF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'حساب تجريبي',
                          style: TextStyle(
                            color: profileTeal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'إعدادات الحساب',
                  style: TextStyle(
                    color: profileNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

              _ProfileOption(
  icon: Icons.person_outline,
  title: 'المعلومات الشخصية',
  subtitle: 'عرض وتعديل بيانات الحساب',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  },
),

                _ProfileOption(
                  icon: Icons.phone_outlined,
                  title: 'رقم الهاتف',
                  subtitle: 'غير متصل حاليًا',
                  onTap: () => _showMessage(context),
                ),

                _ProfileOption(
                  icon: Icons.lock_outline,
                  title: 'الخصوصية والأمان',
                  subtitle: 'إعدادات حماية الحساب',
                  onTap: () => _showMessage(context),
                ),

                _ProfileOption(
                  icon: Icons.notifications_none,
                  title: 'الإشعارات',
                  subtitle: 'إدارة التنبيهات',
                  onTap: () => _showMessage(context),
                ),

                _ProfileOption(
                  icon: Icons.help_outline,
                  title: 'المساعدة والدعم',
                  subtitle: 'الأسئلة الشائعة والتواصل',
                  onTap: () => _showMessage(context),
                ),

                const SizedBox(height: 20),

                OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('تسجيل الخروج'),
                        content: const Text(
                          'تسجيل الخروج غير متصل بنظام الحسابات في هذه النسخة التجريبية.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('حسنًا'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('تسجيل الخروج'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    side: const BorderSide(color: profileBorder),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    'ثِقة • نسخة تجريبية',
                    style: TextStyle(
                      color: profileSecondary,
                      fontSize: 12,
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

  static void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('هذه الخاصية تحتاج إلى ربط النظام الخلفي.'),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: profileBorder),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: profileTeal),
        title: Text(
          title,
          style: const TextStyle(
            color: profileNavy,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: profileSecondary,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_left,
          color: profileSecondary,
        ),
      ),
    );
  }
}
