import 'package:flutter/material.dart';
import '../Models/Model_Gifs.dart';
import '../Provider/Gif_Provider.dart';
import '../Widgets/ListGif.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<ModelGifs>> _listadoGifs;
  late ScrollController _scrollController;
  int offset = 0;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final getprovider = GifProvider();
        offset = offset + 10;

        getprovider.getGifs(offset).then((value) {
          setState(() {
            _listadoGifs.then((gifs) => gifs.addAll(value));
          });
        });
      }
    });
    final getprovider = GifProvider();
    _listadoGifs = getprovider.getGifs(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: ListGifs(snapshot.data as List<ModelGifs>),
              controller: _scrollController,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
