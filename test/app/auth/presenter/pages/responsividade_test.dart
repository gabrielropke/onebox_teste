import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste de responsividade do FractionallySizedBox', (tester) async {
    // Configurar os tamanhos de tela que você deseja testar
    const sizes = [Size(320, 480), Size(600, 800), Size(1080, 1920)];

    for (final size in sizes) {
      // Configurar o tamanho da tela
      tester.binding.window.physicalSizeTestValue = size;
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Build do widget
      await tester.pumpWidget(teste_responsividade_sizedbox());

      // Realizar as verificações de responsividade
      final finder = find.byType(FractionallySizedBox);
      expect(finder, findsOneWidget);

      final fractionallySizedBox = tester.widget(finder) as FractionallySizedBox;
      // Verificar se o widthFactor foi aplicado conforme esperado
      expect(fractionallySizedBox.widthFactor, 0.5);

      // Verificar mais aspectos da responsividade conforme necessário
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
