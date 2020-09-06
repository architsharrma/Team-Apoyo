import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'heartrate.dart';
import 'utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mood, prev;
  bool _isLoaded;
  DocumentSnapshot documentSnapshot;
  DocumentSnapshot foodSnapshot;

  @override
  void initState() {
    _isLoaded = false;
    mood = prev = null;
    Fluttertoast.showToast(
        msg: "Logged in as ${currentUser.email}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 12.0);
    super.initState();
  }

  Future<void> getFood() async {
    foodSnapshot =
        await firestore.collection("food").doc("${random.nextInt(2)}").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Apoyo",
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: double.infinity),
          child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/other.jpeg"),
                    fit: BoxFit.cover)),
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.red,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(8),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Hi there, ${currentUser.displayName}! How are you feeling today?",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_very_satisfied,
                                      color: iconColor,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Happy",
                                    onPressed: () async {
                                      documentSnapshot = await firestore
                                          .collection("Happy")
                                          .doc("${random.nextInt(2)}")
                                          .get();
                                      await getFood();
                                      setState(() {
                                        mood = "Happy";
                                        _isLoaded = true;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Happy",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_dissatisfied,
                                      color: iconColor,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Stressed",
                                    onPressed: () async {
                                      documentSnapshot = await firestore
                                          .collection("Stressed")
                                          .doc("${random.nextInt(2)}")
                                          .get();
                                      await getFood();
                                      setState(() {
                                        mood = "Stressed";
                                        _isLoaded = true;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Stressed",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_neutral,
                                      color: iconColor,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Bored",
                                    onPressed: () async {
                                      documentSnapshot = await firestore
                                          .collection("Bored")
                                          .doc("${random.nextInt(2)}")
                                          .get();
                                      await getFood();
                                      setState(() {
                                        mood = "Bored";
                                        _isLoaded = true;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Bored",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                      color: iconColor,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Depressed",
                                    onPressed: () async {
                                      documentSnapshot = await firestore
                                          .collection("Depressed")
                                          .doc("${random.nextInt(2)}")
                                          .get();
                                      await getFood();
                                      setState(() {
                                        mood = "Depressed";
                                        _isLoaded = true;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Depressed",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                (mood == null)
                    ? Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "select option",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ))
                    : (!_isLoaded)
                        ? Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Text("loading"),
                            color: Colors.white,
                          )
                        : Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(8),
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Are you feeling ${mood}? Apoyo is here to enhance your current state of mind!",
                                        style: mtxt,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            documentSnapshot.data()['title'],
                                            style: ttl,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 5),
                                          child: Image.network(
                                            documentSnapshot.data()['img'],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            documentSnapshot.data()['text'],
                                            style: txt,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(20),
                                    // ),
                                  ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(8),
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Here is something to have, just for you!",
                                        style: mtxt,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            foodSnapshot.data()['title'],
                                            style: ttl,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 5),
                                          child: Image.network(
                                            foodSnapshot.data()['img'],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            foodSnapshot.data()['text'],
                                            style: txt,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(20),
                                    // ),
                                  ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.all(8),
                                  child: Card(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HeartRatePage()),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Want to get your heart rate measured? Click here!",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              )
                            ],
                          )
              ],
            ),
          ),
        ));
  }
}
