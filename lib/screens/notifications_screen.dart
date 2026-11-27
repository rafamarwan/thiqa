
import 'package:flutter/material.dart';

const notificationsNavy = Color(0xFF173B57);
const notificationsTeal = Color(0xFF238B78);
const notificationsBg = Color(0xFFF5F7F8);
const notificationsBorder = Color(0xFFDFE3EA);
const notificationsSecondary = Color(0xFF718096);

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'تحديث حالة البلاغ',
      'message':
          'تم استلام البلاغ، وهو بانتظار المراجعة من الفريق المختص.',
      'time': 'منذ ساعتين',
      'icon': Icons.assignment_outlined,
      'color': const Color(0xFFD9A441),
      'read': false,
    },
    {
      'title': 'طلب معلومات إضافية',
      'message':
          'قد يحتاج فريق المراجعة إلى معلومات أو أدلة إضافية لاستكمال دراسة البلاغ.',
      'time': 'أمس',
      'icon': Icons.info_outline,
      'color': notificationsTeal,
      'read': false,
    },
    {
      'title': 'مرحبًا بك في ثِقة',
      'message':
          'يمكنك متابعة البلاغات والتحديثات المتعلقة بها من خلال حسابك.',
      'time': 'منذ 3 أيام',
      'icon': Icons.verified_user_outlined,
      'color': notificationsNavy,
      'read': true,
    },
  ];

  void markAsRead(int index) {
    setState(() {
      notifications[index]['read'] = true;
    });
  }

  void markAllAsRead() {
    setState(() {
      for (final notification in notifications) {
        notification['read'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount =
        notifications.where((item) => item['read'] == false).length;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: notificationsBg,
        appBar: AppBar(
          title: const Text(
            'الإشعارات',
            style: TextStyle(
              color: notificationsNavy,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: notificationsNavy,
          elevation: 0,
          actions: [
            if (unreadCount > 0)
              TextButton(
                onPressed: markAllAsRead,
                child: const Text(
                  'قراءة الكل',
                  style: TextStyle(
                    color: notificationsTeal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        body: SafeArea(
          child: notifications.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        size: 65,
                        color: notificationsSecondary,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'لا توجد إشعارات',
                        style: TextStyle(
                          color: notificationsNavy,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'ستظهر تحديثات حسابك هنا.',
                        style: TextStyle(
                          color: notificationsSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      children: [
                        const Text(
                          'آخر التحديثات',
                          style: TextStyle(
                            color: notificationsNavy,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$unreadCount غير مقروء',
                          style: const TextStyle(
                            color: notificationsSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      notifications.length,
                      (index) {
                        final item = notifications[index];
                        final isRead = item['read'] as bool;

                        return InkWell(
                          onTap: () => markAsRead(index),
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isRead
                                  ? Colors.white
                                  : const Color(0xFFEAF4F2),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: notificationsBorder,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      (item['color'] as Color)
                                          .withValues(alpha: 0.12),
                                  child: Icon(
                                    item['icon'] as IconData,
                                    color: item['color'] as Color,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item['title'] as String,
                                              style: const TextStyle(
                                                color: notificationsNavy,
                                                fontWeight:
                                                    FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          if (!isRead)
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration:
                                                  const BoxDecoration(
                                                color: notificationsTeal,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        item['message'] as String,
                                        style: const TextStyle(
                                          color: notificationsSecondary,
                                          fontSize: 13,
                                          height: 1.7,
                                        ),
                                      ),
                                      const SizedBox(height: 9),
                                      Text(
                                        item['time'] as String,
                                        style: const TextStyle(
                                          color: notificationsSecondary,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'هذه إشعارات تجريبية. لن تصلك تحديثات فعلية قبل ربط النظام بالخادم.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: notificationsSecondary,
                        fontSize: 12,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
