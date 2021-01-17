import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final drink;
  DetailScreen({this.drink});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          drink["strDrink"],
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: drink["idDrink"],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                      drink["strDrinkThumb"],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "ID : ${drink["idDrink"]}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Drink: ${drink["strDrink"]}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
