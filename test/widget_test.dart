import 'package:birthday_app/features/guests/presentation/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Url widget has a url', (tester) async {
    await tester.pumpWidget(const GuestForm());
    final guestInitName = find.text('');
    final guestInitSurname = find.text('');

    expect(guestInitName, findsOneWidget);
    expect(guestInitSurname, findsOneWidget);
  });
}
