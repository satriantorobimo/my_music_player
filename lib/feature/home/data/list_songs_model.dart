class ListSongsModel {
  int resultCount;
  List<Results> results;

  ListSongsModel({this.resultCount, this.results});

  ListSongsModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['resultCount'] = this.resultCount;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String artistName;
  String previewUrl;
  String artworkUrl60;
  String trackName;

  Results(
      {this.artistName, this.previewUrl, this.artworkUrl60, this.trackName});

  Results.fromJson(Map<String, dynamic> json) {
    artistName = json['artistName'];

    trackName = json['trackName'];

    previewUrl = json['previewUrl'];

    artworkUrl60 = json['artworkUrl60'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['artistName'] = this.artistName;

    data['trackName'] = this.trackName;

    data['previewUrl'] = this.previewUrl;
    data['artworkUrl60'] = this.artworkUrl60;

    return data;
  }
}
