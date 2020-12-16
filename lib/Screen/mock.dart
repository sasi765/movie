import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/Screen/home.dart';
import 'package:movies/Screen/json.dart';


class Mock {


 static generateMock()async{


    MovieService db = MovieService();

    MovieEntity movie = MovieEntity(categories: 'Adventure',
        description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        typeMovie: 'Featured',title:'Aladim',trailer: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/aladim.mp4',country: 'USA',time : '150 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/principal.jpg'),screenShots:List<ImageEntity>(),year: '2019' );

    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'Featured',title:'The Nutcracker',trailer: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/trailer.mp4'
        ,description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        country: 'USA',time : '150 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/principal.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    await db.save(movie);


    movie = MovieEntity(categories: 'Terror',typeMovie: 'Featured',title:'IT 2',trailer: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/Aspect%20Ratio%20-%2016_9%20Video%20Demo.mp4?alt=media&token=4438942b-cd04-4f38-9433-c4267fb5b486'
        ,country: 'USA',time : '150 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/principal.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/8-web-courses-supplement-your-hacking-hhg.jpg?alt=media&token=0f96c582-0c68-4a7e-b67f-2c7b87f9a2d4'));
    movie.screenShots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/sasi-5b3cf.appspot.com/o/depositphotos_14634185-stock-photo-hackers-concept-digital-illustration.jpg?alt=media&token=5e208162-43bf-4f2c-9a1b-911bff9e1b8c'));
    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'MIB'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/1.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Abigail'
        ,country: 'USA',time : '120 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/2.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'MyList',title:'Spride-Man'
        ,country: 'USA',time : '120 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/3.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Avengers'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/4.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Angel Has  Fallen'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/5.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);


    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'GenMan'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/1.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Sonic'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/2.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'Popular',title:'Losing'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/3.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Kid King'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/4.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Angel Has  Fallen'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/5.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);


  }
} 


class MovieService {
  static final String _baseUrl = 'movie';

  final CollectionReference _db;

  MovieService() : _db = FirebaseFirestore.instance.collection(_baseUrl);

/*add or update item*/
  Future<MovieEntity> save(MovieEntity entity) async {
    if (entity.id == null) entity.id = _db.doc().id;

    await _db.doc(entity.id).set(entity.toJson());
    return entity;
  }

  Future<List<MovieEntity>> getByTypeAll(String type) async {
    final CollectionReference _dbs = FirebaseFirestore.instance.collection(_baseUrl);
    QuerySnapshot query =
        await _dbs.where("typeMovie", isEqualTo: type).get();
    List<MovieEntity> products = query.docs
        .map((doc) => MovieEntity.fromSnapshotJson(doc))
        .toList();
    return products;
  }
}