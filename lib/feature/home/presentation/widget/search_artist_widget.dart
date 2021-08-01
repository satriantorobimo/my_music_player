import 'package:flutter/material.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchArtistWidget extends StatefulWidget {
  @override
  _SearchArtistWidgetState createState() => _SearchArtistWidgetState();
}

class _SearchArtistWidgetState extends State<SearchArtistWidget> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 43,
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              String result = value.replaceAll(RegExp(' '), '+').toLowerCase();
              searchProvider.addValue(result);
              searchProvider.addChange(true);
            }
          },
          controller: searchController,
          style: TextStyle(color: Colors.white),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Search by Artist',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Color(0xFF1c1c1e),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1c1c1e), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1c1c1e), width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
