
import 'package:flutter/material.dart';
import 'report_screen.dart';
import 'result_screen.dart';
import 'help_screen.dart';
import 'my_reports_screen.dart';
import 'profile_screen.dart';

const homeNavy = Color(0xFF173B57);
const homeTeal = Color(0xFF238B78);
const homeBg = Color(0xFFF5F7F8);
const homeBorder = Color(0xFFDFE3EA);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final identifierController = TextEditingController();

  String selectedType = 'رقم هاتف';

  final List<Map<String, dynamic>> identifierTypes = [
    {
      'name': 'رقم هاتف',
      'icon': Icons.phone_outlined,
    },
    {
      'name': 'محفظة إلكترونية',
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'name': 'متجر إلكتروني',
      'icon': Icons.storefront_outlined,
    },
    {
      'name': 'جهة تجارية أخرى',
      'icon': Icons.business_outlined,
    },
  ];

  @override
  void dispose() {
    identifierController.dispose();
    super.dispose();
  }

  void checkIdentifier() {
    final identifier = identifierController.text.trim();

    if (identifier.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال المعرّف الذي تريد فحصه.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          identifier: identifier,
          identifierType: selectedType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: homeBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            children: [
              Icon(
                Icons.verified_user_outlined,
                color: homeTeal,
                size: 27,
              ),
              SizedBox(width: 8),
              Text(
                'ثِقة',
                style: TextStyle(
                  color: homeNavy,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '| THIQA',
                style: TextStyle(
                  color: homeNavy,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'تحقّق قبل أن تحوّل',
                  style: TextStyle(
                    color: homeNavy,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'منصتك للتحقق من موثوقية المتاجر والأرقام والمحافظ الإلكترونية قبل التعامل معها.',
                  style: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: homeBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'نوع المعرّف',
                        style: TextStyle(
                          color: homeNavy,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 10,
                        children: identifierTypes.map((type) {
                          final isSelected =
                              selectedType == type['name'];

                          return ChoiceChip(
                            label: Text(type['name']),
                            avatar: Icon(
                              type['icon'] as IconData,
                              size: 18,
                              color: isSelected
                                  ? homeTeal
                                  : homeNavy,
                            ),
                            selected: isSelected,
                            selectedColor:
                                const Color(0xFFE2F4F0),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: isSelected
                                  ? homeTeal
                                  : homeBorder,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                selectedType =
                                    type['name'] as String;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'أدخل المعرّف للفحص',
                        style: TextStyle(
                          color: homeNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: identifierController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          hintText: 'رقم الهاتف أو رابط المتجر...',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: homeTeal,
                          ),
                          filled: true,
                          fillColor: homeBg,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: homeBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: homeBorder,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: checkIdentifier,
                          icon: const Icon(
                            Icons.verified_user_outlined,
                          ),
                          label: const Text(
                            'افحص الآن',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: homeNavy,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'استخدم ثِقة قبل إتمام عملية الشراء أو التحويل.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 13,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: homeTeal,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'بلاغاتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag_outlined),
              label: 'تقديم بلاغ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'المساعدة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'حسابي',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyReportsScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportScreen(),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpScreen(),
                ),
              );
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
