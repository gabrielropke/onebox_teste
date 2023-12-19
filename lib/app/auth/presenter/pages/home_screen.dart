import 'package:flutter/material.dart';
import 'package:onebox_teste/app/auth/presenter/controllers/card_controller.dart';
import 'package:onebox_teste/app/auth/presenter/widgets/confirm_dialog.dart';
import 'package:onebox_teste/app/auth/presenter/widgets/delete_dialog.dart';
import 'package:onebox_teste/app/auth/presenter/widgets/options_bottom.dart';
import 'package:onebox_teste/app/auth/presenter/widgets/text_field_box.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController textController = TextEditingController();
  final cardController _cardController = cardController();

  @override
  void initState() {
    super.initState();
    _cardController.addListener(() {
      setState(() {});
    });
    _loadData();
  }

  @override
  void dispose() {
    _saveData();
    super.dispose();
  }

  _loadData() async {
    await _cardController.loadText();
  }

  _saveData() async {
    await _cardController.saveText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: FractionallySizedBox(
            widthFactor: 0.26,
            child: Image.asset(
              'assets/images/splash_img.png',
              color: const Color(0xFFF2922A),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: options_bottom(
              clearCard: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: FractionallySizedBox(
              widthFactor: 0.95,
              heightFactor: 0.9,
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: _cardController.text.isEmpty
                      ? FractionallySizedBox(
                          heightFactor: 0.2,
                          child: Image.asset('assets/images/center_icon.png'))
                      : ListView.builder(
                          itemCount: _cardController.text.length,
                          itemBuilder: (context, index) {
                            Message message = _cardController.text[index];
                            return Column(
                              children: [
                                ListTile(
                                  title: Wrap(
                                    children: [
                                      ReadMoreText(
                                        message.text,
                                        trimLines: 2,
                                        colorClickableText: Colors.blue,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'ver mais',
                                        trimExpandedText: ' ver menos',
                                        moreStyle: const TextStyle(
                                          color: Color(0xFFF2922A),
                                          fontSize: 14,
                                        ),
                                        lessStyle: const TextStyle(
                                          color: Color(0xFFF2922A),
                                          fontSize: 14,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                        DateFormat('HH:mm')
                                            .format(message.time),
                                        style: const TextStyle(
                                            color: Colors.black26)),
                                  ),
                                  trailing: FractionallySizedBox(
                                      heightFactor: 0.4,
                                      child: GestureDetector(
                                        onTap: () {
                                          DeleteDialog.show(context, () {
                                            setState(() {
                                              _cardController.text
                                                  .removeAt(index);
                                              _cardController.saveText();
                                            });
                                          });
                                        },
                                        child: Image.asset(
                                            'assets/images/icon_delete.png'),
                                      )),
                                ),
                                const FractionallySizedBox(
                                    widthFactor: 0.9, child: Divider()),
                              ],
                            );
                          })),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: text_field_box(
                    controller: textController,
                    sendText: () {
                      textController.text.isEmpty
                          ? null
                          : ConfirmDialog.show(context, () {
                              _cardController.sendText(
                                  text: textController.text);
                              textController.clear();
                            });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
