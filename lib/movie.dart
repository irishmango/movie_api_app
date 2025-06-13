class Movie {
  String title;
  String poster;
  String plot;

  Movie({
    required this.title,
    required this.poster,
    required this.plot,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'N/A',
      poster: json['Poster'] ?? '',
      plot: json['Plot'] ?? 'No plot available',
    );
  }
}