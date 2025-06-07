import 'package:flutter/material.dart';

class ContextUtil {
  static late BuildContext _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static BuildContext get currentContext => _context;
}