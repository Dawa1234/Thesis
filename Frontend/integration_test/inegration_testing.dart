
import 'package:SAAYADecor/screens/signin.dart';
import 'package:SAAYADecor/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
 // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "testing the widgets",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/register': (context) => SignUp(),
        },
        home: const SignIn(),
      ));
      Finder email = find.byKey(const ValueKey("txtEmail"));
      await tester.enterText(email, "safal123@gmail.com");
      Finder password = find.byKey(const ValueKey("txtPassword"));
      await tester.enterText(password, "safal12345");
      Finder signup = find.byKey(const ValueKey("btnRegister"));
      await tester.dragUntilVisible(
        signup,
        find.byType(Scaffold),
        const Offset(0, 70),
      );
      await tester.tap(signup);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}

class IntegrationTestWidgetsFlutterBinding {
}
