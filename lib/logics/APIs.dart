import 'package:http/http.dart' as http;

class APIs{
  final baseUrl="https://raw.githubusercontent.com/busrepository/busrepo/main";
  final imageURl='https://raw.githubusercontent.com/busrepository/busrepo/main';
  final newsUrl="https://raw.githubusercontent.com/busrepository/busrepo/main/news.js";


  Future fetchRoutes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/routes1.js'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }



  Future<List<String>> fetchNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl/news.js'),
    );

    if (response.statusCode == 200) {
      // Extract the JavaScript content
      String data = response.body;

      // Remove lines starting with "//"
      List<String> lines = data.split('\n');
      lines = lines.where((line) => !line.trim().startsWith('//')).toList();

      // Combine the remaining lines back into a string
      String cleanedData = lines.join('\n');

      // Extract the news content from the cleaned string using regex
      RegExp regExp = RegExp(r'var news\d\s*=\s*"([^"]*)";');
      Iterable<RegExpMatch> matches = regExp.allMatches(cleanedData);

      // Convert the matches into a list of non-empty strings
      List<String> newsList = matches
          .map((match) => match.group(1) ?? "")
          .where((news) => news.isNotEmpty)
          .toList();

      return newsList;
    } else {
      throw Exception('Failed to load data');
    }
  }


}