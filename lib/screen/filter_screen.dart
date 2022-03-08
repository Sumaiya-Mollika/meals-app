import 'package:deli_meals_app/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool?> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenFree = false;
  bool? _vagetarian = false;
  bool? _vegan = false;
  bool? _lactosefree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactosefree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vagetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      var currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vagetarian,
                };

                widget.saveFilters(selectedFilters);
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-Free', 'Onlu include gluten-free meal', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Lactose-Free', 'Onlu include lactose-free meal', _lactosefree,
                (newValue) {
              setState(() {
                _lactosefree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vagetarian', 'Onlu include vagetarian meal', _vagetarian,
                (newValue) {
              setState(() {
                _vagetarian = newValue;
              });
            }),
            _buildSwitchListTile('Vegan', 'Onlu include Vegan meal', _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            })
          ],
        ))
      ]),
    );
  }
}
