import 'dart:convert';
import './Info.dart';

import 'package:flutter/material.dart';
import "./Detail_Screen.dart";
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  void initState() {
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CocktailApp')),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Info(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
          child: res != null
              ? ListView.builder(
                  //itemExtent: ,
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              drink["strDrinkThumb"] ??
                                  "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                            ),
                          ),
                        ),
                        title: Text(
                          drink['strDrink'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          drink["idDrink"],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(drink: drink),
                            ),
                          );
                        },
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )),
    );
  }
}
