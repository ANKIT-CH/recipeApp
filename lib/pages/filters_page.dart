import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters-page';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersPage(this.currentFilters, this.saveFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool filterValue, Function temp) {
    return SwitchListTile(
      value: filterValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: temp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('apply filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(filters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Apply all the filters here',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'switch on to remove only gluten free meals',
                  _glutenFree,
                  (val) {
                    setState(
                      () {
                        _glutenFree = val;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'switch on to remove only lactose free meals',
                  _lactoseFree,
                  (val) {
                    setState(
                      () {
                        _lactoseFree = val;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'switch on to remove only Vegetarian meals',
                  _vegetarian,
                  (val) {
                    setState(
                      () {
                        _vegetarian = val;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'switch on to remove only Vegan meals',
                  _vegan,
                  (val) {
                    setState(
                      () {
                        _vegan = val;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
