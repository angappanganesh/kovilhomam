import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class KovilmaiyamPage extends StatefulWidget {
  final imgPath;

  KovilmaiyamPage({Key? key, this.imgPath}) : super(key: key);

  @override
  _KovilmaiyamPageState createState() => _KovilmaiyamPageState();
}

class _KovilmaiyamPageState extends State<KovilmaiyamPage> {

  bool tempValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 25),
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                /*
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/avnsm.png'),
                          fit: BoxFit.cover)),
                ),
                 */
                SizedBox(width: 15)
              ],
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.95), BlendMode.dstATop),
            child: new Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 630,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(31, 58, 47, 1.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          listItemStats('images/om1.png',"Kovilmaiyam is Kovil service wing of Aramm Valartha Nayagi Sevai Maiyam. It encompasses Saraswati, Dhanvantari, Sakthi, Mano and Prabhanja maiyams. Install the app below to know more.".tr(),true),
                          //listItemStats('images/air-conditioner.png',"Air Conditioner", false),
                          //listItemStats('images/washing-machine.png',"Washing Machine", false)
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Divider(color: Colors.white,)
                      ),
                      SizedBox(height: 21),
                      TextButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              androidPackageName: 'com.avnsm.kovilmaiyam',
                              // openStore: false
                            );
                            // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
                            // The second arguments decide wether the app redirects PlayStore or AppStore.
                            // For testing purpose you can enter com.instagram.android
                          },
                          child: Container(
                              child: Center(
                                child: Hero(
                                  tag: 'avnsm',
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avnsm.png'),
                                  ),
                                ),
                              ))
                      ),
                      /*
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Maximum Power", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("60W", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Total Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("145", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Average Daily Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("5.6", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Divider(color: Colors.white,)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Day Schedule", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Switch(
                          value: tempValue,
                          onChanged: (newVal){
                            setState(() {
                              tempValue = newVal;
                              print(newVal);
                            });
                          },
                          activeColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                  */
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
