class UrlString {
  static final Map<String, String> headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> getHeaderType() {
    return headerType;
  }

  String getUrlSearchArtist(String searchParam) {
    return 'https://itunes.apple.com/search?term=$searchParam';
  }
}
