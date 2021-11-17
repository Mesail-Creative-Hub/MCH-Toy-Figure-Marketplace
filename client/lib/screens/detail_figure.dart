import 'package:flutter/material.dart';
import '../models/figure.dart';
import 'package:sweetalert/sweetalert.dart';

class DetailFigure extends StatefulWidget {
  final Figure detailFigure;
  const DetailFigure({Key? key, required this.detailFigure}) : super(key: key);

  @override
  _DetailFigureState createState() => _DetailFigureState();
}

class _DetailFigureState extends State<DetailFigure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text("Detail Figure",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(widget.detailFigure.image,
                      height: double.infinity, width: double.infinity)),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            spreadRadius: 0.8,
                            blurRadius: 10.0)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 2.0,
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: const Color(0xFF595959),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(widget.detailFigure.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.0)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.detailFigure.price,
                                          style: const TextStyle(
                                              color: Color(0xFFA95AC5),
                                              fontSize: 19.0),
                                        )),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("About the product",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0))),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(
                                      widget.detailFigure.description,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          color: Color(0xFF535353)),
                                    ),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: IconButton(
                                icon: Icon(
                                  widget.detailFigure.isFavorite
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_border_outlined,
                                  color: const Color(0xFFA95AC5),
                                  size: 35.0,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    widget.detailFigure.isFavorite =
                                        !widget.detailFigure.isFavorite;
                                  })
                                },
                              ))
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart_outlined,
                      color: Color(0xFFA95AC5)),
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFA95AC5))),
                  child:
                      const Text("Buy", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    SweetAlert.show(context,
                        title: "Success",
                        subtitle:
                            "you buy a item",
                        style: SweetAlertStyle.success);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
