class Constant {
  static const String apiKey = "";
  static const String topHeadlines =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  static String newByCountry(String country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";
  }

  static const Map<String, String> countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn',
  };
}
