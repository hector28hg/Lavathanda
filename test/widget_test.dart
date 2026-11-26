import 'package:flutter_test/flutter_test.dart';
import 'package:lavathanda/main.dart';

void main() {
  testWidgets('Lavathanda muestra la información principal', (tester) async {
    await tester.pumpWidget(const LavathandaApp());

    expect(find.text('LAVATHANDA'), findsOneWidget);
    expect(find.text('Tu ropa limpia y cuidada'), findsOneWidget);
    expect(find.text('¿Quiénes somos?'), findsOneWidget);
  });
}
