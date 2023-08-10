

import 'package:SAAYADecor/screens/signin.dart';
import 'package:SAAYADecor/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "testing the widgets",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/signin': (context) => const SignIn(),
        },
        home: const SignUp(),
      ));
      Finder name = find.byKey(const ValueKey("txtName"));
      await tester.enterText(name, "Malik");
      Finder email = find.byKey(const ValueKey("txtEmail"));
      await tester.enterText(email, "malik@gmail.com");
      Finder password = find.byKey(const ValueKey("txtPassword"));
      await tester.enterText(password, "baba1412914@");
      Finder confirmPassword = find.byKey(const ValueKey("txtConfirmPassword"));
      await tester.enterText(password, "baba1412914@");
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
