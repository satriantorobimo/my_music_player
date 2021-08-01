import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_music_player_app/feature/home/data/list_songs_model.dart';
import 'package:my_music_player_app/feature/home/domain/repo/search_artist_repo.dart';
import 'bloc.dart';

class SearchArtistBloc extends Bloc<SearchArtistEvent, SearchArtistState> {
  SearchArtistBloc({@required this.searchArtistRepo})
      : assert(searchArtistRepo != null),
        super(SearchArtistInitial());

  ListSongsModel listSongsModel;

  SearchArtistRepo searchArtistRepo;

  @override
  Stream<SearchArtistState> mapEventToState(
    SearchArtistEvent event,
  ) async* {
    if (event is GetSearchArtist) {
      yield SearchArtistLoading();
      try {
        listSongsModel = await searchArtistRepo.searchArtist(event.param);
        if (listSongsModel.resultCount != 0)
          yield SearchArtistLoaded(listSongsModel: listSongsModel);
        else
          yield const SearchArtistError('no_data');
      } catch (e) {
        yield SearchArtistError(e.toString());
      }
    }
  }
}
