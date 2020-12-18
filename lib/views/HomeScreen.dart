import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_autocomplete/utils/SizeConfig.dart';
import 'package:google_place/google_place.dart';

final String API_KEY = "AIzaSyBz551675mT0X81vjb3I1cjVPWcd9oiUkA";
List<AutocompletePrediction> predictions = [];
GooglePlace googlePlace;

class HomeScreen extends StatefulWidget {
    @override
    _HomeScreenState createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    googlePlace = GooglePlace(API_KEY);
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      SizeConfig().init(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Google Autocomplete',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.black
            ),
          ),
        ),
        body: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          height: SizeConfig.blockSizeVertical * 100,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Search",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      autoCompleteSearch(value);
                    } else {
                      if (predictions.length > 0 && mounted) {
                        setState(() {
                          predictions = [];
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(predictions[index].description),
                        onTap: () {
                         // TODO

                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ),
        ),
      );
    }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  }



