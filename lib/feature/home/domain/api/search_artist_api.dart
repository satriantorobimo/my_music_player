import 'package:my_music_player_app/core/resources/url.dart';
import 'package:my_music_player_app/core/util/network_util.dart';
import 'package:my_music_player_app/feature/home/data/list_songs_model.dart';

class SearchArtistApi {
  ListSongsModel listSongsModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<ListSongsModel> searchArtist(String param) async {
    final Map<String, String> header = urlString.getHeaderType();

    return await netUtil
        .get(urlString.getUrlSearchArtist(param), headers: header)
        .then((dynamic res) {
      listSongsModel = ListSongsModel.fromJson(res);
      return listSongsModel;
    }).catchError((e) => print(e));
  }
}
