import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model ---------------------------------------------------

class SingleSelectCountry with ChangeNotifier {
  final List<String> _items = <String>[
    "Argentina",
    "Belgium",
    "Brazil",
    "Denmark",
    "England",
    "France",
    "Finland",
    "Germany",
    "Holland",
    "Ireland",
    "Norway",
    "Poland",
    "Scotland",
    "Spain",
    "Sweden",
    "Switzerland",
    "Wales",
  ];

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

// User Interface ------------------------------------------

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    // The provider has to be in the widget tree higher than
    // both `CountryDropDown` and `UserOffers`.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleSelectCountry>(
          create: (final BuildContext context) {
            return SingleSelectCountry();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Home Page'),
        ),
        body: Restrictions(),
      ),
    );
  }
}

class Restrictions extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        CountryDropDown(),
        UserOffers(),
      ],
    );
  }
}

class CountryDropDown extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Consumer<SingleSelectCountry>(
      builder: (
        final BuildContext context,
        final SingleSelectCountry singleSelectCountry,
        final Widget child,
      ) {
        return DropdownButton<String>(
          hint: const Text("Not selected"),
          icon: const Icon(Icons.flight),
          value: singleSelectCountry.selected,
          onChanged: (final String newValue) {
            singleSelectCountry.selected = newValue;
          },
          items: singleSelectCountry.items.map<DropdownMenuItem<String>>(
            (final String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class UserOffers extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Consumer<SingleSelectCountry>(
      builder: (
        final BuildContext context,
        final SingleSelectCountry singleSelectCountry,
        final Widget child,
      ) {
        return Text(singleSelectCountry.selected ?? '');
      },
    );
  }
}
