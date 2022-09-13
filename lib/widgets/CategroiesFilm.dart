// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_ui/Models/movies.dart';

import '../Screens/DetayPage.dart';

class CategroiesFilm extends StatelessWidget {
  final String icerik;
  final List<Movie> moviePoserList;

  const CategroiesFilm({
    Key? key,
    required this.icerik,
    required this.moviePoserList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        height: 0.25.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              icerik,
              style: TextStyle(),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h, bottom: 3.h),
                scrollDirection: Axis.horizontal,
                itemCount: moviePoserList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => DetayPage(
                                moviek: moviePoserList[index].moviekImage ??
                                    moviePoserList[index].moviePoster,
                                moviePosterPath:
                                    moviePoserList[index].moviePoster,
                              ))));
                    },
                    child: SizedBox(
                      width: 140.w,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(moviePoserList[index].moviePoster,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
