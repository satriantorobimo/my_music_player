import 'package:my_music_player_app/feature/home/data/list_songs_model.dart';
import 'package:my_music_player_app/feature/home/domain/api/search_artist_api.dart';

class SearchArtistRepo {
  final SearchArtistApi searchArtistApi = SearchArtistApi();
  Future<ListSongsModel> searchArtist(String param) =>
      searchArtistApi.searchArtist(param);
}
