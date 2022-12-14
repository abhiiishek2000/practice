import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dream11_prank_app/screens/custom_bottom_nav.dart';
import 'package:dream11_prank_app/screens/details_screens.dart';
import 'package:dream11_prank_app/screens/intro_page.dart';
import 'package:dream11_prank_app/screens/noti_screen.dart';
import 'package:dream11_prank_app/screens/practice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'notifications.dart';

const simplePeriodicTask = "simplePeriodicTask";


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false); //to true if still in testing lev turn it to false whenever you are launching the app
  await Workmanager().registerPeriodicTask("5", simplePeriodicTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15),//when should it check the link
      initialDelay: Duration(seconds: 5),//duration before showing the notification
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));
  runApp(MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    // FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    // var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // var iOS = IOSInitializationSettings();

    // var initSetttings = InitializationSettings(android, iOS);
    // flp.initialize(initSetttings);

    createPlantFoodNotification();
    return Future.value(true);
  });
}

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().then((value) {
//     AwesomeNotifications().initialize(
//       'resource://drawable/ic_launcher',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelDescription: 'Simple Notification',
//           channelName: 'Basic Notifications',
//           defaultColor: Colors.teal,
//           importance: NotificationImportance.High,
//           channelShowBadge: true,
//         ),
//         NotificationChannel(
//           channelKey: 'scheduled_channel',
//           channelDescription: 'Schedule Notification',
//           channelName: 'Scheduled Notifications',
//           defaultColor: Colors.teal,
//           locked: true,
//           importance: NotificationImportance.High,
//           soundSource: 'resource://raw/res_custom_notification',
//         ),
//       ],
//     );
//     runApp(const MyApp());
//   });
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'regular',
        ),

      home:  NotiScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const IntroPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffc1342a),
      body: Center(
        child: Text('Dreem11 1 Cr',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w700),),
      ),
    );
  }
}

