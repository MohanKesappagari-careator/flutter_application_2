import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _jokes = [
    {
      "question": "What does a baby computer call its father?",
      "answer": "Data"
    },
    {
      "question": "What's a pencil with two erasers called?",
      "answer": "Pointless"
    },
    {
      "question": "Why is the calendar always scared?",
      "answer": "Because it's days are numbered"
    },
    {"question": "What do you call a fish with no eye", "answer": "Fsh"},
  ];
  var jokeIndex = 0;
  changeJokeIndex(String direction) {
    if (direction == "next") {
      if (jokeIndex == _jokes.length - 1) {
        jokeIndex = 0;
      } else {
        setState(() {
          jokeIndex++;
        });
      }
    } else if (direction == "prev") {
      if (jokeIndex != 0) {
        setState(() {
          jokeIndex--;
        });
      } else {
        jokeIndex = _jokes.length - 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                child: Text(
                  _jokes[jokeIndex]["question"] as String,
                  style: TextStyle(fontSize: 27.5, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 20),
                child: Text(
                  _jokes[jokeIndex]["answer"] as String,
                  style:
                      TextStyle(fontSize: 22.5, fontWeight: FontWeight.normal),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: FloatingActionButton(
                      onPressed: () {
                        changeJokeIndex("prev");
                      },
                      child: Icon(Icons.arrow_left_rounded, size: 60),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        changeJokeIndex("next");
                      },
                      child: Icon(
                        Icons.arrow_right_rounded,
                        size: 60,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// body: Query(
//         options: QueryOptions(document: gql(product)), //QueryOptios
//         builder: (QueryResult result, {fetchMore, refetch}) {
//           if (result.hasException) {
//             return Text(result.exception.toString());
//           }
//           if (result.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final productList = result.data?['products']['edges'];
//           print(productList);
//           return Text("somting");
//         },
//       )