import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeParser {
  static dateFormater(String date) {
    try {
      return DateFormat('MMM d, yyy').parse(date);
    } catch (e) {
      return Exception("Invalid Date Format");
    }
  }
}
