
import 'package:flutter_test/flutter_test.dart';
import 'package:thiqa/main.dart';

void main() {
  testWidgets('Thiqa app test', (WidgetTester tester) async {
    await tester.pumpWidget(const ThiqaApp());

    expect(find.text('ثِقة'), findsOneWidget);
  });
}
