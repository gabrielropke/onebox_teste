import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message {
  final String text;
  final DateTime time;

  Message({required this.text, required this.time});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'time': time.toIso8601String(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'],
      time: DateTime.parse(map['time']),
    );
  }
}

class cardController extends ChangeNotifier {
  final List<Message> _text = [];
  List<Message> get text => _text;

  Future<void> saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedText = _text.map((message) {
      Map<String, dynamic> messageMap = message.toMap();
      return jsonEncode(messageMap);
    }).toList();
    prefs.setStringList('text', encodedText);
  }

   void clearCard() {
    _text.clear();
    saveText();
    notifyListeners();
  }

  Future<void> loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedText = prefs.getStringList('text');
    if (encodedText != null) {
      _text.clear();
      _text.addAll(encodedText.map((encodedMessage) {
        Map<String, dynamic> messageMap = jsonDecode(encodedMessage);
        return Message.fromMap(messageMap);
      }));
      notifyListeners();
    }
  }

  sendText({required String text}) {
    DateTime currentTime = DateTime.now();
    Message message = Message(text: text, time: currentTime);
    _text.add(message);
    saveText();
    notifyListeners();
  }
}
