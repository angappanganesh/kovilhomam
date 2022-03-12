import 'package:flutter/material.dart';
import 'package:kovilhomam/homampage.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:kovilhomam/kovilmaiyampage.dart';
import 'package:kovilhomam/volunteerpage.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends KFDrawerContent {
  Home({
    Key? key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String Lang = 'English';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        child: Material(
                          shadowColor: Colors.transparent,
                          color: Colors.transparent,
                          child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onPressed: widget.onMenuPressed,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: Text(Lang),
                        onPressed: () {
                          setState(() {
                            if(Lang == 'English') {
                              EasyLocalization.of(context)!.setLocale(Locale('en', 'EN'));
                              Lang = 'Tamil'.tr();
                            }
                            else {
                              EasyLocalization.of(context)!.setLocale(Locale('ta', 'IN'));
                              Lang = 'English';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Hero(
                    tag: 'avnsm',
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('images/avnsm.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(width: 15)
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Welcome".tr(), style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text("Family Welfare Homam".tr(), style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text("Homam or Yajnam is a powerful ritual, rich in symbolism, where humans offer something to the Gods through the medium of fire, "
                        "and in return expect that the Gods will reciprocate with strength.", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 30),
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            listItem('images/homamnewed1.png', 1),
                            new SizedBox(width: 15),
                            listItem('images/volunteernewed1.png', 2),
                            new SizedBox(width: 15),
                            //listItem('images/maiyamnewed1.png', 3),
                          ],
                        )
                      )
                    ),
                    SizedBox(height: 15),
                    Text("", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color.fromRGBO(31, 58, 47, 1.0),
                  //color: Color.fromRGBO(143, 26, 42, 1.0),
                  //color: Colors.orangeAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    listItemStats('images/yajna5.png',"1000+ homams all over Tamilnadu".tr()),
                    listItemStats('images/volunteer3.png',"4000+ volunteers across the world".tr()),
                    //listItemStats('images/om1.png',"5 Maiyams on devotional service".tr())
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgpath, int pageIndex){
    return InkWell(
      onTap: (){
        if(pageIndex == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  HomamPage(
                    imgPath: imgpath,
                  )));
        }
        else if(pageIndex == 2) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VolunteerPage(
                imgPath: imgpath,
              )));
        }
        else if(pageIndex == 3) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => KovilmaiyamPage(
                imgPath: imgpath,
              )));
        }
      },
      child: Stack(
        children: [
          Container(
            width: 325,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: AssetImage(imgpath),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                  child: TextButton.icon(onPressed: null, icon: Icon(Icons.arrow_forward_ios, color: Colors.deepOrangeAccent,), label: Text(
                    (pageIndex == 1) ? 'Register for Homam'.tr() : (pageIndex == 2) ? 'Register as Volunteer'.tr() : 'More about Kovilmaiyam'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent, fontFamily: 'trocchi', fontWeight: FontWeight.bold),
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemStats(String imgpath, String name){
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          //color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          //Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          Image(image: AssetImage(imgpath),width: 55,height: 55),
          SizedBox(height: 15),
          //Text(name, style: TextStyle(fontSize: 13, color: value == true ? Colors.black : Colors.white))
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
