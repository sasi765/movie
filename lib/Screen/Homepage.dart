import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies/Screen/detail.dart';
import 'package:movies/Screen/json.dart';
import 'package:movies/Screen/moviebloc.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: ListView(
        children: <Widget>[
          TopWidget(),
          CategoryWidget(),
          VerticalMovieWidge(
              title: 'My List', listMovieFlux: _movieBloc.listMoviesMyListFlux),
          VerticalMovieWidge(
              title: 'Popular', listMovieFlux: _movieBloc.listMoviesPopularFlux)
        ],
      ),
    );
  }

  getAppBar() => AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Center(
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          onPressed: () => {},
          icon: new Icon(
            Icons.sort,
            color: Colors.black,
            size: 25.0,
          ),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => {},
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      );
}


class TopWidget extends StatefulWidget {
  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.8);

  MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280.0,
        width: double.infinity,
        child: StreamBuilder(
            initialData: List<MovieEntity>(),
            stream: _movieBloc.listMoviesFlux,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return Container(height: 1, width: 1);

              return PageView.builder(
                controller: _pageController,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemHeadMovie(snapshot.data[index], context, index);
                },
              );
            }));
  }

  _itemHeadMovie(MovieEntity movie, BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsMoviePage(
              movie: movie,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movie.title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/background.jpg',
                        height: 190.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: movie.screenShot.url,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 70.0,
              child: Align(
                child: Container(
                  width: 250.0,
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalMovieWidge extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;

  final String title;

  const VerticalMovieWidge({Key key, this.listMovieFlux, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => print('View'),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: StreamBuilder(
                initialData: List<MovieEntity>(),
                stream: listMovieFlux,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) return Container(height: 1, width: 1);

                  List<MovieEntity> movies = snapshot.data;
                  return listView(movies);
                }),
          ),
        ],
      ),
    );
  }

  listView(List<MovieEntity> movies) => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/background.jpg',
                height: 190.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: movies[index].screenShot.url,
              ),
            ),
          );
        },
      );
}

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.0,
        child: StreamBuilder(
            initialData: List<MovieEntity>(),
            stream: _movieBloc.listMoviesFlux,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return Container(height: 1, width: 1);

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  MovieEntity movie = snapshot.data[index] as MovieEntity;
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 160.0,
                    child: PhysicalShape(
                        color: Colors.transparent,
                        shadowColor: Colors.red,
                        elevation: 5.0,
                        clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: RawMaterialButton(
                            fillColor: Colors.transparent,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 0.0,
                            textStyle: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                            onPressed: null,
                            constraints: BoxConstraints.loose(Size(160, 90)),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.2),
                                          BlendMode.dstATop),
                                      image: new NetworkImage(
                                        movie.screenShot.url,
                                      )),
                                  gradient: LinearGradient(
                                      colors: const [
                                        Color(0xffec2F4B),
                                        Color(0xffC02425)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Center(child: Text(movie.categories)),
                            ))),
                  );
                },
              );
            }));
  }
}
