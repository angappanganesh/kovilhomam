import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kovilhomam/profile.dart';
import 'package:kovilhomam/class_builder.dart';
import 'package:kovilhomam/home.dart';
import 'package:kovilhomam/schedules.dart';
import 'package:kovilhomam/settings.dart';
import 'package:kovilhomam/stats.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:kovilhomam/testimonials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ClassBuilder.registerClasses();
  runApp(EasyLocalization(child: MyApp(),
      saveLocale: true,
      supportedLocales: [
        Locale('ta', 'IN'),
        Locale('en', 'EN')
      ],
      startLocale: Locale('ta', 'IN'),
      path: "assets/langs"));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Map<int, Color> _greenMap = {
      50: Color.fromRGBO(31, 58, 47, 1.0),
      100: Color.fromRGBO(31, 58, 47, 1.0),
      200: Color.fromRGBO(31, 58, 47, 1.0),
      300: Color.fromRGBO(31, 58, 47, 1.0),
      400: Color.fromRGBO(31, 58, 47, 1.0),
      500: Color.fromRGBO(31, 58, 47, 1.0),
      600: Color.fromRGBO(31, 58, 47, 1.0),
      700: Color.fromRGBO(31, 58, 47, 1.0),
      800: Color.fromRGBO(31, 58, 47, 1.0),
      900: Color.fromRGBO(31, 58, 47, 1.0),
    };

    final MaterialColor _greenSwatch =
    MaterialColor(Color.fromRGBO(31, 58, 47, 1.0).value, _greenMap);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.grey,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _greenSwatch,
        ).copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController? _drawerController;
  String Lang = 'English';

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        /*
        KFDrawerItem.initWithPage(
          text: Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.account_box, color: Colors.white),
          page: Profile(),
        ),
        */
        KFDrawerItem.initWithPage(
          text: Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.notifications_active, color: Colors.white),
          page: ClassBuilder.fromString('Notifications'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Testimonials',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.feedback, color: Colors.white),
          page: Testimonials(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Stats',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.trending_up, color: Colors.white),
          page: Stats(),
        ),
        /*
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
        */
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage('images/avnsm.png'),
                        fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Aramm Valartha Nayagi', style: new TextStyle(fontSize: 17, color: Colors.white)),
                    new SizedBox(height: 2),
                    new Text('Sevai Maiyam', style: new TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        /*
        footer: KFDrawerItem(
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        */
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(31, 58, 47, 1.0), Color.fromRGBO(31, 58, 47, 1.0)],
            //colors: [Color.fromRGBO(143, 26, 42, 1.0), Color.fromRGBO(143, 26, 42, 1.0)],
            //colors: [Color.fromRGBO(182, 56, 56, 1.0), Color.fromRGBO(182, 56, 56, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

