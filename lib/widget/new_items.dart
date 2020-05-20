import 'package:flutter/material.dart';
import 'package:fruit_ui/model/list_item.dart';

class NewItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      margin: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0))),
      child: Row(children: <Widget>[
        RotatedBox(
            quarterTurns: 3,
            child: Container(
              margin: EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: Text(
                "New Items",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            )),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 130.0,
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 7.0, vertical: 24.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15.0,
                              offset: Offset(0, 25),
                              color: Colors.grey[500].withOpacity(0.6),
                              spreadRadius: -20.0),
                        ]),
                    child: Column(children: <Widget>[
                      Image(
                        height: 70.0,
                        width: 70.0,
                        image: AssetImage(
                            "assets/fruits/" + listItems[index].image),
                      ),
                      Text(
                        listItems[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 9.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: listItems[index].price + ".00",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: " (" + listItems[index].kg + ")"),
                            ]),
                      )
                    ]),
                  );
                }))
      ]),
    );
  }
}
