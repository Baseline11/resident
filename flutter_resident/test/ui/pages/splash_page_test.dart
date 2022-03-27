import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/presentation/mixins/navigation_manager.dart';
import 'package:flutter_resident/ui/pages/splash/splash.dart';

import './../helpers/helpers.dart';
import './../mocks/mocks.dart';

void main() {
  late SplashPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = SplashPresenterSpy();
    await tester.pumpWidget(
        makePage(path: '/', page: () => SplashPage(presenter: presenter)));
  }

  tearDown(() {
    presenter.dispose();
  });

  testWidgets('Should show brand logo on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets('Should call loadCurrentAccount on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    verify(() => presenter.checkAccount()).called(1);
  });

  testWidgets('Should change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo(
      NavigationState(route: '/any_route'),
    );
    await tester.pumpAndSettle();

    expect(currentRoute, '/any_route');
    expect(find.text('fake page'), findsOneWidget);
  });

  testWidgets('Should not change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo(NavigationState(route: ''));
    await tester.pump();
    expect(currentRoute, '/');
  });
}
