import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';


  String getMessageTime(DateTime messageTime,BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(messageTime);

    final daysAgo = difference.inDays;

    String timestampText;
    if (daysAgo == 0) {
      timestampText = DateFormat('HH:mm').format(messageTime);
    } else if (daysAgo == 1) {
      timestampText = AppLocalizations.of(context)!.yesterday;
    } else if (daysAgo < 7) {
      timestampText = DateFormat('EEEE').format(messageTime);
    } else {
      final messageTimeFormatted = DateFormat('dd.MM.yyyy').format(messageTime);
      timestampText = messageTimeFormatted;
    }
    return timestampText;
  }

