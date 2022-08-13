import 'package:dot_bottom_nav/dot_bottom_nav.dart';
import 'package:dream11_prank_app/screens/bar.dart';
import 'package:flutter/material.dart';

class CustomNav extends StatefulWidget {
  const CustomNav({Key? key,this.selected,this.unselected}) : super(key: key);
  final Color? selected;
  final Color? unselected;

  @override
  _CustomNavState createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.account_circle),
                ),
                title: Text('Name $index'),
                subtitle: Text('Name $index'),
              );
            }),
        bottomNavigationBar: DotBottomNav(
          currentIndex: selectedIndex,
          selectedColor: Colors.indigo,
          unSelectedColor: Colors.black54,
          indicatorType: IndicatorType.top,
          dotIndicatorWidth: 8,
          enableDotIndicator: true,
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          navBarItems: [
            NavBarItems(icon: Icons.home, label: "Home"),
            NavBarItems(icon: Icons.email, label: "Email"),
            NavBarItems(icon: Icons.phone, label: "Phone"),
            NavBarItems(icon: Icons.settings, label: "Settings"),
          ],
        ),
      ),
    );
  }
}
