import 'package:dream11_prank_app/screens/practice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var listIntros = <Widget>[
      IntroItem(
          data: Intro("assets/images/image-1.jpg", "Headline 1",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")),
      IntroItem(
          data: Intro("assets/images/image-2.jpg", "Headline 2",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")),
      IntroItem(
          data: Intro("assets/images/image-3.jpg", "Headline 3",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")),
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: listIntros.length,
              itemBuilder: (context, index) {
                return listIntros[currentIndex];
              },
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
            Positioned(
              bottom: 26,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < listIntros.length; i++)
                          if (i == currentIndex) ...[circleBar(true)] else
                            circleBar(false),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BasketButton(
                        context: context,
                        title: currentIndex == 2 ? "Get Started" : "Skip",
                        onClick: () {
                          if (currentIndex != 2) {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PracticeScreen()));
                          }
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      )

    );
  }

}

//page button

Widget BasketButton({required String title, required Function() onClick, required BuildContext context}) {
  return InkWell(
    onTap:onClick,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent.withOpacity(0.80),
            blurRadius: 10,
          )
        ]

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: Text(title,style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),),
      ),
    ),
  );
}


// page indicator

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.only(right: 8),
    height: 4,
    width: isActive ? 35 : 15,
    decoration: BoxDecoration(
        color: isActive ? Colors.orangeAccent : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}

// pageview dynamic
class IntroItem extends StatefulWidget {
  const IntroItem({Key? key, required this.data}) : super(key: key);
  final Intro data;

  @override
  _IntroItemState createState() => _IntroItemState();
}

class _IntroItemState extends State<IntroItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: RoundShape(),
          child: Container(
              height: size.height * 0.7,
              width: size.width,
              color: Colors.orangeAccent,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width * 0.65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 10,
                                offset: Offset(0, 6))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              widget.data.image,
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                  )
                ],
              )),
        ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.data.header,style: Theme.of(context).textTheme.headline6,),
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Text(widget.data.desc,style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.black)),
        )
      ],
    );
  }
}

// clipper
class RoundShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double curveHeight = size.height / 4;
    var p = Path();
    p.lineTo(0, height - curveHeight);
    p.quadraticBezierTo(width / 2, height, width, height - curveHeight);
    p.lineTo(width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

//model for items
class Intro {
  final String image;
  final String header;
  final String desc;

  Intro(this.image, this.header, this.desc);
}