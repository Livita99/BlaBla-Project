import 'package:flutter/material.dart';
import '../../dummy_data/dummy_data.dart';
import '../../model/ride/locations.dart';
import '../../theme/theme.dart';

class LocationPicker extends StatefulWidget {
  final Function(Location) onLocationSelected;

  const LocationPicker({super.key, required this.onLocationSelected});

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  List<Location> filteredLocations = [];
  TextEditingController searchController = TextEditingController();

  void _filterLocations(String query) {
    setState(() {
      filteredLocations = fakeLocations
          .where((location) =>
              location.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _clearSearch() {
    setState(() {
      searchController.clear();
      filteredLocations = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Location',
                      border: InputBorder.none,
                    ),
                    onChanged: _filterLocations,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearSearch,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(filteredLocations[index].name,
                          style: BlaTextStyles.body),
                      onTap: () {
                        widget.onLocationSelected(filteredLocations[index]);
                        Navigator.of(context).pop();
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
