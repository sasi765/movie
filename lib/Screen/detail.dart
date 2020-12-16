import 'package:flutter/material.dart';
import 'package:movies/Screen/json.dart';
import 'package:video_player/video_player.dart';


class DetailsMoviePage extends StatefulWidget {
  final MovieEntity movie;

  DetailsMoviePage({this.movie});

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.movie.trailer)
      ..initialize().then((_) {});
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _controller.value.isPlaying
                ? Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.pause();
                            _controller = VideoPlayerController.network(
                                widget.movie.trailer)
                              ..initialize().then((_) {});
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      )
                    ],
                  )
                : ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -50.0, 0.0),
                            child: Hero(
                              tag: widget.movie.title,
                              child: ShadowClip(
                                clipper: CircularClipper(),
                                shadow: Shadow(blurRadius: 20.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/cross.jpg',
                                  height: 400.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: widget.movie.screenShot.url,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.only(left: 30.0),
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back),
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                              Image(
                                image: AssetImage('assets/cross.jpg'),
                                height: 60.0,
                                width: 150.0,
                              ),
                              IconButton(
                                padding: EdgeInsets.only(left: 30.0),
                                onPressed: () => {},
                                icon: Icon(Icons.favorite_border),
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Positioned.fill(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                elevation: 12.0,
                                onPressed: () {
                                  setState(() {
                                    _controller.play();
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 60.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 20.0,
                            child: IconButton(
                              onPressed: () => print('Add to My List'),
                              icon: Icon(Icons.add),
                              iconSize: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 25.0,
                            child: IconButton(
                              onPressed: () => print('Share'),
                              icon: Icon(Icons.share),
                              iconSize: 35.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.movie.title.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.movie.categories,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              '',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Year',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      widget.movie.year.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                     widget.movie.country,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      widget.movie.country.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      widget.movie.year,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      "widget.movie.time",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25.0),
                            Container(
                              height: 120.0,
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.movie.description,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalMovieWidget(title: 'Screen', movie: widget.movie)
                    ],
                  ),
          ),
        ));
  }
}


class VerticalMovieWidget extends StatelessWidget {
  final MovieEntity movie;

  final String title;

  const VerticalMovieWidget({Key key, this.movie, this.title})
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
                  onTap: () => print('View  '),
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
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: movie.screenShots.length,
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
                      image: movie.screenShots[index].url,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class CircularClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@immutable
class ShadowClip extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ShadowClip({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
} 