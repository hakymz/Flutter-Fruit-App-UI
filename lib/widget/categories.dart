import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_ui/model/list_item.dart';
import 'package:fruit_ui/screen/product_screen.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    this._controller.addListener(() {
      _selectCatergoryIndex();
    });
    super.initState();
  }

  _selectCatergoryIndex() {
    Timer(Duration(milliseconds: 400), () {
      var newIndex = _controller.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex.round();
        });
      }
    });
  }

  _scrollToItem(index) {
    double position = index * 210.0;

    _controller.animateTo(position,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[_listCategory(), _fruitShow()]);
  }

  Widget _listCategory() {
    return Container(
      height: 45.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });

                _scrollToItem(_selectedIndex);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                                style: _selectedIndex == index
                                    ? BorderStyle.solid
                                    : BorderStyle.none))),
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      listItems[index].name,
                      style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 16.0,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            );
          }),
    );
  }

  Widget _fruitShow() {
    return Container(
      height: 360.0,
      margin: EdgeInsets.only(top: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
              width: 210.0,
              decoration: BoxDecoration(
                  color: Color(int.parse(listItems[index].color)),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset(0, 30),
                        color: Color(int.parse(listItems[index].color))
                            .withOpacity(0.6),
                        spreadRadius: -20.0)
                  ]),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        listItems[index].name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: listItems[index].price + ".00",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: " (" + listItems[index].kg + ")")
                        ]),
                      )
                    ],
                  ),
                ),
                Hero(
                  tag: listItems[index].name,
                  child: Image(
                    image:
                        AssetImage("assets/fruits/" + listItems[index].image),
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    listItems[index].description,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductScreen(
                                  item: listItems[index],
                                )));
                  },
                )
              ]),
            );
          }),
    );
  }
}
