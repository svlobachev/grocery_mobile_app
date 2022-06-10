import 'dart:collection';
import 'package:flutter/material.dart';

class SingleSelectGender with ChangeNotifier {
  final List<String> _items = <String>[];

  String _selectedItem;

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(this._items);
  }

  String get selected {
    return this._selectedItem;
  }

  set selected(final String item) {
    this._selectedItem = item;
    this.notifyListeners();
  }
}
