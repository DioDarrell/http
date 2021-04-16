import 'package:flutter/material.dart';
import 'package:js9/pages/movie_detail.dart';
import 'package:js9/Service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          // return Card(
          //   color: Colors.white,
          //   elevation: 0.0,
          //   child: ListTile(
          //     title: Text(movies[position].title),
          //     subtitle: Text(
          //       'Rating = ' + movies[position].voteAverage.toString(),
          //     ),
          //     onTap: () {
          //       MaterialPageRoute route = MaterialPageRoute(
          //           builder: (_) => MovieDetail(movies[position]));
          //       Navigator.push(context, route);
          //     },
          //   ),
          // );
          return Card(
            elevation: 0.0,
            child: InkWell(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Image.network(
                      imgPath + movies[position].posterPath,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120),
                      child: Text(
                        movies[position].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 60),
                      child: Text(
                        "Release Date",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 70),
                      child: Text(
                        movies[position].releaseDate.toString(),
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 110),
                      child: Text(
                        "Rate",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        movies[position].voteAverage.toString(),
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
