import 'dart:collection';
import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier {
  final List<String> _items = <String>[];

  String _selectedItem;

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(_items);
  }

  String get selected {
    return _selectedItem;
  }

  set selected(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
