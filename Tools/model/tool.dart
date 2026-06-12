import 'package:flutter/material.dart';

class Tool {
  final String name;
  final IconData icon;
  final Color bg;
  final String desc;
  int days = 1;
  final int price;
  Tool(
      {required this.name,
      required this.bg,
      required this.price,
      this.days = 1,
      required this.desc,
      required this.icon});
}
