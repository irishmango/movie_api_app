import 'package:flutter/material.dart';
import 'movie_service.dart';
import 'movie.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<Movie>? _movie;
  final TextEditingController _textController = TextEditingController();
  bool _hasSearched = false;

  void _searchMovie() {
    final query = _textController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _hasSearched = true;
        _movie = MovieService().getMovie(query);
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Info',
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie Info')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: _hasSearched
                      ? FutureBuilder<Movie>(
                          future: _movie,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final movie = snapshot.data!;
                              return SingleChildScrollView(
                                child: Card(
                                  color: Theme.of(context).cardColor, 
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.title,
                                          style: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(190, 0, 0, 0),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(movie.poster),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          movie.plot,
                                          style: const TextStyle(fontSize: 16, color: Colors.black),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text("${snapshot.error}"));
                            }
                            return const Center(child: CircularProgressIndicator());
                          },
                        )
                      : const Center(
                          child: Text(
                            'Search for a movie',
                            style: TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Enter movie title...',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _searchMovie,
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }
}