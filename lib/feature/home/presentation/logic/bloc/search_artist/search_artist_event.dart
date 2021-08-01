import 'package:equatable/equatable.dart';

abstract class SearchArtistEvent extends Equatable {
  const SearchArtistEvent();

  @override
  List<Object> get props => [];
}

class GetSearchArtist extends SearchArtistEvent {
  final String param;
  GetSearchArtist(this.param);
  @override
  List<Object> get props => [param];
}
