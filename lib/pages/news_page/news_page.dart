import 'package:bus_o_pedia/logics/APIs.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final Future<List<String>> allNews;

  @override
  void initState() {
    allNews = APIs().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<String>>(
          future: allNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading news'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No news available'));
            } else {
              List<String> newsList = snapshot.data!;
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        newsList[index]
                            .replaceAll(' <br> ', '\n')
                            .replaceAll(' <br>', '\n')
                            .replaceAll('<br> ', '\n')
                            .replaceAll('<br>', '\n'),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
