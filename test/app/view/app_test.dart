import 'package:alchemy/app/app.dart';
import 'package:alchemy/splash/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders SplashPage as initial route', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });
}
