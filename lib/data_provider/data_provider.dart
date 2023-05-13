import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:giga_chat/models/chat_item.dart';

class DataProvider {
  static Future<List<ChatItem>> loadData() async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonResult = jsonDecode(data);
    return (jsonResult as List).map((e) => ChatItem.fromJson(e)).toList();
  }
}
