import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:junior_jobs_mock/main.dart';

void main() {
  testWidgets('Junior Jobs deschide feed-ul de joburi', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 920));

    await tester.pumpWidget(const JuniorJobsApp());

    expect(find.text('Intra in Junior Jobs'), findsOneWidget);
    await tester.tap(find.text('Intra in Junior Jobs'));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Ospatar'), findsOneWidget);
    expect(find.text('Comunitate'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);

    await tester.binding.setSurfaceSize(null);
  });
}
