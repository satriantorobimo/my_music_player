import 'package:equatable/equatable.dart';
import 'package:my_music_player_app/feature/home/data/list_songs_model.dart';

abstract class SearchArtistState extends Equatable {
  const SearchArtistState();

  @override
  List<Object> get props => [];
}

class SearchArtistInitial extends SearchArtistState {}

class SearchArtistLoading extends SearchArtistState {}

class SearchArtistLoaded extends SearchArtistState {
  const SearchArtistLoaded({this.listSongsModel});
  final ListSongsModel listSongsModel;

  @override
  List<Object> get props => [listSongsModel];
}

class SearchArtistError extends SearchArtistState {
  const SearchArtistError(this.error) : assert(error != null);
  final String error;

  @override
  List<Object> get props => [error];
}
