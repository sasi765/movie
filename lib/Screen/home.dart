import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies/Screen/Homepage.dart';
import 'package:movies/Screen/mock.dart';
import 'package:movies/Screen/moviebloc.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*here generate info*/
// Mock.GenerateMock();

    return BlocProvider(
      blocs: [
        Bloc((i) => MovieBloc(MovieService())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
              
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(bodyText1: TextStyle(fontSize: 16)))),
    );
  }
}
class ImageEntity {
  ImageEntity({this.url = ''});

  String url;

  ImageEntity.fromMap(Map<dynamic, dynamic> data) : url = data["Url"];

  toJson() {
    return {"Url": this.url};
  }
}