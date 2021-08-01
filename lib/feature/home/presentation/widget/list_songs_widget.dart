import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_music_player_app/feature/home/data/list_songs_model.dart';
import 'package:my_music_player_app/feature/home/domain/repo/search_artist_repo.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/bloc/search_artist/bloc.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/provider/play_provider.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ListSongsWidget extends StatefulWidget {
  @override
  _ListSongsWidgetState createState() => _ListSongsWidgetState();
}

class _ListSongsWidgetState extends State<ListSongsWidget> {
  ListSongsModel listSongsModel;
  SearchArtistBloc searchArtistBloc =
      SearchArtistBloc(searchArtistRepo: SearchArtistRepo());

  @override
  void dispose() {
    searchArtistBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _getData() {
    String value = Provider.of<SearchProvider>(context, listen: true).value;

    Provider.of<SearchProvider>(context, listen: true).addChange(false);
    searchArtistBloc.add(GetSearchArtist(value));
  }

  @override
  Widget build(BuildContext context) {
    final bool changes =
        Provider.of<SearchProvider>(context, listen: true).change;

    if (changes) {
      _getData();
    }
    return BlocListener<SearchArtistBloc, SearchArtistState>(
        cubit: searchArtistBloc,
        listener: (_, SearchArtistState state) {},
        child: BlocBuilder<SearchArtistBloc, SearchArtistState>(
            cubit: searchArtistBloc,
            builder: (_, SearchArtistState state) {
              if (state is SearchArtistInitial) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                      child: Text('Search Your Favourite Artist',
                          style: TextStyle(color: Colors.grey))),
                );
              }
              if (state is SearchArtistLoading) {
                return loadingData();
              }
              if (state is SearchArtistLoaded) {
                return mainContent(state.listSongsModel);
              }
              if (state is SearchArtistError) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                      child: Text('Artist Not Found',
                          style: TextStyle(color: Colors.grey))),
                );
              }
              return Container();
            }));
  }

  Widget loadingData() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black,
            );
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.white,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1c1c1e).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 70,
              ),
            );
          }),
    );
  }

  Widget mainContent(ListSongsModel listSongsModel) {
    final playProvider = Provider.of<PlayProvider>(context);
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.grey,
              );
            },
            padding: const EdgeInsets.all(8.0),
            itemCount: listSongsModel.resultCount,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  playProvider.addState(
                      listSongsModel.results[index].trackName ?? 'Unknown',
                      listSongsModel.results[index].artworkUrl60,
                      true,
                      listSongsModel.results[index].previewUrl);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                listSongsModel.results[index].artworkUrl60),
                            fit: BoxFit.fill)),
                  ),
                  title: Text(
                    listSongsModel.results[index].trackName ?? 'Unknown',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    listSongsModel.results[index].artistName ?? 'Unknown',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }));
  }
}
