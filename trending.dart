import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(
              text: 'Trending Movies',
              size: 26,
            ),
            SizedBox(height: 10,),
            Container(height: 270,
            child: ListView.builder(itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index){
              return InkWell(
                onTap: (){

                },
                child: Container(
                  child: Column(children: [Container(height:200, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                  )
                  )),
                  ),
                  Container(child: modified_text(text:trending[index]['title']!=null?
                  trending[index]['title']:'Loading'),)],)

                ),
                ),
              )
            }),)
          ],
        ));
  }
}
