import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Model_Gifs.dart';


List<Widget> ListGifs(List<ModelGifs> listado) {
  final List<Widget> gifs = [];
      listado.forEach((element) {
    gifs.add(
      Card(
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              element.url,
              fit: BoxFit.fill,
            )),
          ],
        ),
      ),
    );
  });
  
  return gifs;
}
