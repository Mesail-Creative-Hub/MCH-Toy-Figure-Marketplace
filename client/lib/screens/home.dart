import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/figure.dart';
import '../models/brand.dart';
import 'detail_figure.dart';
import 'collection_brand.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: const [
              TopBrand(),
              PopularMonth(),
              Recommendation(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Brand>> fetchTopBrand() async {
  final response =
      await http.get(Uri.parse("http://192.168.100.53:8000/api/v1/brands"));
  if (response.statusCode == 200) {
    final dataTopBrand = <Brand>[];
    for (final topBrand in jsonDecode(response.body)) {
      dataTopBrand.add(Brand.fromJson(topBrand));
    }
    return dataTopBrand;
  } else {
    throw Exception("failed to load top brands");
  }
}

class TopBrand extends StatefulWidget {
  const TopBrand({Key? key}) : super(key: key);

  @override
  _TopBrandState createState() => _TopBrandState();
}

class _TopBrandState extends State<TopBrand> {
  late Future<List<Brand>> dataTopBrand;

  @override
  void initState() {
    super.initState();
    dataTopBrand = fetchTopBrand();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.all(10.0),
          height: 50.0,
          child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  hintStyle: TextStyle(fontSize: 10.0),
                  hintText: "What You Looking For?",
                  suffixIcon: Icon(
                    Icons.search,
                    size: 25.0,
                  )))),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            Row(children: [
              const Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top Brand",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              )),
              GestureDetector(
                  onTap: () {},
                  child: const Text("View All",
                      style: TextStyle(color: Color(0xFF7A7A7A))))
            ]),
            Expanded(
                child: FutureBuilder<List<Brand>>(
                    future: dataTopBrand,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final topBrand = snapshot.data![index];

                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CollectionBrand(
                                              brand: topBrand)));
                                },
                                child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: (MediaQuery.of(context).size.width *
                                            (1 / 3)) -
                                        30.0,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, .05),
                                              spreadRadius: 0.1,
                                              blurRadius: 10.0)
                                        ]),
                                    child: Column(children: [
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              width: double.infinity,
                                              child: Image.network(
                                                  topBrand.image,
                                                  alignment:
                                                      Alignment.center))),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              width: double.infinity,
                                              child: Image.network(
                                                  topBrand.subImage,
                                                  alignment: Alignment.center)))
                                    ])));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    }))
          ],
        ),
      ),
    ]);
  }
}

Future<List<Figure>> fetchPopularMonth() async {
  final response =
      await http.get(Uri.parse("http://192.168.100.53:8000/api/v1/figures"));
  if (response.statusCode == 200) {
    final dataPopularMonth = <Figure>[];
    for (final popularMonth in jsonDecode(response.body)) {
      dataPopularMonth.add(Figure.fromJson(popularMonth));
    }
    return dataPopularMonth;
  } else {
    throw Exception("Failed to load Popular Month");
  }
}

class PopularMonth extends StatefulWidget {
  const PopularMonth({Key? key}) : super(key: key);

  @override
  _PopularMonthState createState() => _PopularMonthState();
}

class _PopularMonthState extends State<PopularMonth> {
  late Future<List<Figure>> dataPopularMonth;

  @override
  void initState() {
    super.initState();
    dataPopularMonth = fetchPopularMonth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: MediaQuery.of(context).size.height * 0.60,
      child: Column(
        children: [
          Row(children: [
            const Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular This Month",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ))),
            GestureDetector(
                onTap: () {},
                child: const Text("View All",
                    style: TextStyle(
                      color: Color(0xFF7A7A7A),
                    )))
          ]),
          Expanded(
              child: FutureBuilder<List<Figure>>(
            future: dataPopularMonth,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Expanded(
                        child: Column(children: [
                      Expanded(
                          child:
                              BoxPopularMonth(popularMonth: snapshot.data![1])),
                      Expanded(
                          child:
                              BoxPopularMonth(popularMonth: snapshot.data![2]))
                    ])),
                    Expanded(
                        child: BoxPopularMonth(popularMonth: snapshot.data![3]))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            },
          ))
        ],
      ),
    );
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

Future<List<Figure>> fetchRecommendation() async {
  final response =
      await http.get(Uri.parse("http://192.168.100.53:8000/api/v1/figures"));
  if (response.statusCode == 200) {
    final dataRecommendation = <Figure>[];
    for (final recommendation in jsonDecode(response.body)) {
      dataRecommendation.add(Figure.fromJson(recommendation));
    }
    return dataRecommendation;
  } else {
    throw Exception("failed to load recommendations");
  }
}

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  late Future<List<Figure>> recommendations;
  int _selectedIndexRecommendation = 0;

  @override
  void initState() {
    super.initState();
    recommendations = fetchRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(children: [
          Row(children: [
            const Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recommendations",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ))),
            GestureDetector(
                onTap: () {},
                child: const Text("View All",
                    style: TextStyle(
                      color: Color(0xFF7A7A7A),
                    )))
          ]),
          Expanded(
              child: FutureBuilder<List<Figure>>(
            future: recommendations,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Expanded(
                      flex: 6,
                      child: GestureDetector(
                          onHorizontalDragUpdate: (details) {},
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailFigure(
                                        detailFigure: snapshot.data![
                                            _selectedIndexRecommendation])));
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.05),
                                        spreadRadius: 0.1,
                                        blurRadius: 10.0),
                                  ]),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(children: [
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 6.0),
                                                    child: Align(
                                                        alignment:
                                                            Alignment
                                                                .centerLeft,
                                                        child: Text(
                                                            snapshot
                                                                .data![
                                                                    _selectedIndexRecommendation]
                                                                .title,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 19.0),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 3)))),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      snapshot
                                                          .data![
                                                              _selectedIndexRecommendation]
                                                          .price,
                                                      style: const TextStyle(
                                                          fontSize: 17.0))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: IconButton(
                                                    icon: Icon(
                                                        snapshot
                                                                .data![
                                                                    _selectedIndexRecommendation]
                                                                .isFavorite
                                                            ? Icons
                                                                .favorite_outlined
                                                            : Icons
                                                                .favorite_border_outlined,
                                                        color: const Color(
                                                            0xFFFF4A4A)),
                                                    onPressed: () {
                                                      setState(() {
                                                        snapshot
                                                                .data![
                                                                    _selectedIndexRecommendation]
                                                                .isFavorite =
                                                            !snapshot
                                                                .data![
                                                                    _selectedIndexRecommendation]
                                                                .isFavorite;
                                                      });
                                                    },
                                                  )),
                                            )
                                          ],
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Image.network(snapshot
                                            .data![_selectedIndexRecommendation]
                                            .image))
                                  ]))))),
                  Expanded(
                      flex: 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final recommendation = snapshot.data![index];

                          return Container(
                              margin: const EdgeInsets.all(8.0),
                              constraints: const BoxConstraints(
                                  maxWidth: 340 / 4, maxHeight: 340 / 4),
                              width:
                                  MediaQuery.of(context).size.width * (1 / 4),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.05),
                                        spreadRadius: 0.1,
                                        blurRadius: 10.0),
                                  ]),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndexRecommendation = index;
                                    });
                                  },
                                  child: Image.network(recommendation.image,
                                      fit: BoxFit.fill)));
                        },
                      ))
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            },
          ))
        ]));
  }
}
