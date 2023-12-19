import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onebox_teste/app/presenter/controllers/card_controller.dart';

void main() {
  group("Test message send", () {
    testWidgets('Testando o envio de mensagem', (WidgetTester tester) async {
      cardController controller = cardController();

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    controller.sendText(text: "Teste de mensagem");
                  },
                  child: Text("envio"),
                );
              },
            ),
          ),
        ),
      );

      // Disparar uma ação de toque no botão
      await tester.tap(find.text("envio"));
      await tester.pump();

      expect(controller.text.length, 1);
      expect(controller.text[0].text,
          "Teste de mensagem");
    });
  });
}
