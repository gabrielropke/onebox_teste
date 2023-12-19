import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste de responsividade do FractionallySizedBox',
      (tester) async {
    const sizes = [Size(320, 480), Size(600, 800), Size(1080, 1920)];

    for (final size in sizes) {
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(teste_responsividade_sizedbox());
      final finder = find.byType(FractionallySizedBox);
      expect(finder, findsOneWidget);

      final fractionallySizedBox =
          tester.widget(finder) as FractionallySizedBox;
      expect(fractionallySizedBox.widthFactor, 0.5);
    }
  });
}

class teste_responsividade_sizedbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Image.asset('assets/images/logo_onebox.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
