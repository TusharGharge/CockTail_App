import "package:flutter/material.dart";

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("About Developer"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("Assets/Images/chracter.jpeg"),
                ),
              ),
              SizedBox(height: 20),
              Text("Tushar Vilas Gharge",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                "abour:Hey There,If you update any features or anything wothout any hesitation Pull request",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
