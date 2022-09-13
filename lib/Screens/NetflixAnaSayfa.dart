import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_ui/Models/movies.dart';
import '../widgets/GradiantLogoDesign.dart';
import '../widgets/CategroiesFilm.dart';

class NetflixHomePage extends StatelessWidget {
  NetflixHomePage({Key? key}) : super(key: key);

  List<Movie> popularMovies = List.generate(
      5,
      (index) => Movie(
          "assets/image/movie_poster/populer_movies/netflix_populer${index + 1}.jpg",
          "assets/image/moviek/populark/populark${index + 1}.jpg"));

  List<Movie> sucMovies = List.generate(
      5,
      (index) => Movie(
          "assets/image/movie_poster/suc_movies/suc${index + 1}.jpg",
          "assets/image/moviek/suck/suck${index + 1}.jpg"));

  List<Movie> warMovies = List.generate(
      3,
      (index) => Movie(
          "assets/image/movie_poster/war_movies/ww2${index + 1}.jpg",
          "assets/image/moviek/wark/wark${index + 1}.jpg"));
  List<Movie> animeMovies = List.generate(
      5,
      (index) => Movie(
          "assets/image/movie_poster/anime_movies/anime${index + 1}.jpg",
          "assets/image/moviek/animek/animek${index + 1}.jpg"));
  List<Movie> bilimMovies = List.generate(
      5,
      (index) => Movie(
          "assets/image/movie_poster/bilim_movies/bilim${index + 1}.jpg",
          "assets/image/moviek/bilimk/bilimk${index + 1}.jpg"));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.r),
      child: Stack(
        children: [
          ListView(
            children: [
              CategroiesFilm(
                icerik: "Netflix Popüler",
                moviePoserList: popularMovies,
              ),
              Divider(
                color: Color.fromARGB(255, 219, 76, 76),
                height: 15.h,
                thickness: 1,
              ),
              CategroiesFilm(
                icerik: "Suç",
                moviePoserList: sucMovies,
              ),
              Divider(
                color: Color.fromARGB(255, 219, 76, 76),
                height: 15.h,
                thickness: 1,
              ),
              CategroiesFilm(
                moviePoserList: warMovies,
                icerik: "Savaş",
              ),
              Divider(
                color: Color.fromARGB(255, 219, 76, 76),
                height: 15.h,
                thickness: 1,
              ),
              CategroiesFilm(
                moviePoserList: animeMovies,
                icerik: "Anime",
              ),
              Divider(
                color: Color.fromARGB(255, 219, 76, 76),
                height: 15.h,
                thickness: 1,
              ),
              CategroiesFilm(
                moviePoserList: bilimMovies,
                icerik: "Bilim Kurgu",
              ),
              // CategroiesFilm(icerik: "Komedi"),
            ],
          ),
          const Positioned(
              top: 0, right: 0, left: 0, child: GradiantLogoDesign()),
        ],
      ),
    );
  }
}
