import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 10;
  bool isVisibleTime = true;
  bool isVisible =true;
  int currentSeconds = 0;

  @override
  void initState() {
    startTimeout();
    Timer(
        Duration(seconds: timerMaxSeconds),
            () => setState(() {
          isVisible = false;
        }));
    super.initState();

  }

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) % 60).toString()}';

  startTimeout([int? milliseconds]) {
    var duration = interval;

    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;

        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isVisibleTime == true
              ? Stack(
                  children: [
                    Container(
                      height: size.height * 0.8,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/ic_ad.png',
                            height: size.height * 0.8,
                            width: size.width,
                          ),
                         Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if(isVisible ==true)    Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                       Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        decoration: const BoxDecoration(
                                            color: Colors.black),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 2),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Skip Ad in $timerText seconds',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if(isVisible ==false) Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            isVisibleTime = false;
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.black),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Skip Ad',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const Icon(
                                                    Icons.skip_next,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                            ),
                          ),
                           Align(
                            alignment: Alignment(1, -1.03),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Ad',style: TextStyle(color: Colors.white),),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Image.asset('assets/images/ic_prank.gif')
        ],
      ),
    );
  }
}
