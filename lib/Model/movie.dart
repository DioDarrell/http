class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;
  String releaseDate;
  int runtime;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath,
      this.releaseDate, this.runtime);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
    this.releaseDate = parsedJson['release_date'];
    this.runtime = parsedJson['runtime'];
  }
}
