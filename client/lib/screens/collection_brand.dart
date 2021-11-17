import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/figure.dart';
import '../models/brand.dart';
import 'detail_figure.dart';

class CollectionBrand extends StatefulWidget {
  final Brand brand;
  const CollectionBrand({Key? key, required this.brand}) : super(key: key);

  @override
  _CollectionBrandState createState() => _CollectionBrandState();
}

class _CollectionBrandState extends State<CollectionBrand> {
  late Future<List<Figure>> dataBrandCollection;

  @override
  void initState() {
    super.initState();
    dataBrandCollection = fetchCollectionBrand(widget.brand);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("${widget.brand.name} Brand",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: Container(
              margin: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Color(0xFFA95AC5),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: IconButton(
                iconSize: 20.0,
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            backgroundColor: Colors.white),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10.0),
                height: 50.0,
                child: TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        hintStyle: const TextStyle(fontSize: 10.0),
                        hintText: "Find Your ${widget.brand.name}?",
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 25.0,
                        )))),
            Expanded(
              child: FutureBuilder<List<Figure>>(
                future: dataBrandCollection,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(snapshot.data!.length, (index) {
                        return BoxPopularMonth(
                            popularMonth: snapshot.data![index]);
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                },
              ),
            )
          ],
        )));
  }
}

Future<List<Figure>> fetchCollectionBrand(Brand brand) async {
  final response = await http.get(
      Uri.parse("http://192.168.100.53:8000/api/v1/figures?brand_id=${brand.id}"));
  if (response.statusCode == 200) {
    final dataBrandCollection = <Figure>[];
    for (final brandCollection in jsonDecode(response.body)) {
      dataBrandCollection.add(Figure.fromJson(brandCollection));
    }
    return dataBrandCollection;
  } else {
    throw Exception("failed to load brand ${brand.name}");
  }
}

class BoxPopularMonth extends StatefulWidget {
  final Figure popularMonth;

  const BoxPopularMonth({Key? key, required this.popularMonth})
      : super(key: key);

  @override
  _BoxPopularMonthState createState() => _BoxPopularMonthState();
}

class _BoxPopularMonthState extends State<BoxPopularMonth> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailFigure(detailFigure: widget.popularMonth)));
        },
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      spreadRadius: 0.1,
                      blurRadius: 10.0)
                ]),
            child: Column(children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                          color: Color(0xFFFAC6A9)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(widget.popularMonth.image,
                            height: double.infinity, width: double.infinity),
                      ))),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.0),
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.popularMonth.title,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.popularMonth.price,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                        ]),
                      ),
                      Expanded(
                          flex: 2,
                          child: IconButton(
                            icon: Icon(
                                widget.popularMonth.isFavorite
                                    ? Icons.favorite_outlined
                                    : Icons.favorite_border_outlined,
                                color: const Color(0xFFFF4A4A)),
                            onPressed: () => {
                              setState(() {
                                widget.popularMonth.isFavorite =
                                    !widget.popularMonth.isFavorite;
                              })
                            },
                          ))
                    ],
                  ))
            ])));
  }
}
