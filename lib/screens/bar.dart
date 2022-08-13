//
// // ignore_for_file: prefer_const_constructors_in_immutables
//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
//
// enum IndicatorType { top, bottom }
// class DotBottomBar extends StatelessWidget {
//   DotBottomBar({Key? key,
//     this.backgroundColor,
//     this.selectedColor,
//     required this.navBarItems,
//     this.unSelectedColor,
//     this.unselectedFontSize = 12,
//     this.selectedFontSize = 14,
//     this.selectedIconSize = 24,
//     this.unselectedIconSize = 20,
//     this.splashColor,
//     this.currentIndex = 0,
//     this.dotIndicatorColor =Colors.indigo,
//     required this.onTap,
//     this.enableDotIndicator = true,
//     this.dotIndicatorWidth = 6,
//     this.radius =16,
//     this.indicatorType = IndicatorType.top,
//     this.margin,
//     this.gradient,
//   }) : super(key: key);
//   final Color? backgroundColor;
//   final List<NavBarItems> navBarItems;
//   final Color? selectedColor;
//   final Color? unSelectedColor;
//   final double unselectedFontSize;
//   final Color? splashColor;
//   final Color dotIndicatorColor;
//   final int currentIndex;
//   final bool enableDotIndicator;
//   final double dotIndicatorWidth;
//   final IndicatorType indicatorType;
//   final Function(int) onTap;
//   final double selectedFontSize;
//   final double selectedIconSize;
//   final double unselectedIconSize;
//   final double radius;
//   final LinearGradient? gradient;
//   final EdgeInsets? margin;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin ?? const EdgeInsets.only(left: 16,bottom: 16,right: 16),
//       width: double.infinity,
//       decoration:  BoxDecoration(
//           color: backgroundColor ?? Colors.white,
//           borderRadius: BorderRadius.circular(radius),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.16),
//               blurRadius: 10,
//             )
//           ],
//           gradient: gradient
//       ),
//       child: SingleChildScrollView(
//         child: Row(
//           children: [
//             for (int i = 0; i < navBarItems.length; i++) ...[
//               Expanded(
//                 child: DotBottomBarItems(
//                   selectedColor: selectedColor,
//                   unSelectedColor: unSelectedColor,
//                   icon: navBarItems[i].icon,
//                   label: navBarItems[i].label,
//                   unSelectedFontSize: unselectedFontSize,
//                   selectedFontSize: selectedFontSize,
//                   unselectedIconSize: unselectedIconSize,
//                   selectedIconSize: selectedIconSize,
//                   splashColor: splashColor,
//                   currentIndex: currentIndex,
//                   enableDotIndicator: enableDotIndicator,
//                   dotIndicatorWidth: dotIndicatorWidth,
//                   indicatorType: indicatorType,
//                   dotIndicatorColor: dotIndicatorColor,
//                   index: i,
//                   onTap: onTap,
//                 ),
//               ),
//             ],
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NavBarItems {
//   final IconData icon;
//   final String label;
//
//   NavBarItems({
//     required this.icon,
//     required this.label,
//   });
// }
//
// class DotBottomBarItems extends StatelessWidget {
//   final IconData? icon;
//   final String? label;
//   final Color? selectedColor;
//   final Color? unSelectedColor;
//   final double? unSelectedFontSize;
//   final double? selectedIconSize;
//   final double unselectedIconSize;
//   final double selectedFontSize;
//   final Color? splashColor;
//   final int? currentIndex;
//   final int index;
//   final Function(int) onTap;
//   final bool? enableDotIndicator;
//   final double dotIndicatorWidth;
//   final Color dotIndicatorColor;
//   final IndicatorType indicatorType;
//
//   DotBottomBarItems({Key? key,
//     this.icon,
//     this.label,
//     this.selectedColor,
//     this.unSelectedColor,
//     this.unSelectedFontSize,
//     this.selectedFontSize = 12,
//     this.selectedIconSize,
//     this.unselectedIconSize = 24,
//     this.splashColor,
//     required this.dotIndicatorColor,
//     this.currentIndex,
//     required this.onTap,
//     required this.index,
//     this.enableDotIndicator,
//     required this.dotIndicatorWidth,
//     this.indicatorType = IndicatorType.top,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final BottomNavigationBarThemeData bottomTheme =
//     BottomNavigationBarTheme.of(context);
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         splashColor: splashColor ?? Theme.of(context).splashColor,
//         onTap: () {
//           onTap(index);
//         },
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             currentIndex ==index && indicatorType == IndicatorType.top && enableDotIndicator==true ? DotIndicator(dotIndicatorColor: dotIndicatorColor,dotIndicatorWidth: dotIndicatorWidth,)  : Container(),
//             const SizedBox(height: 8),
//             Icon(
//               icon,
//               size: currentIndex == index
//                   ? selectedIconSize
//                   : unselectedIconSize,
//               color: currentIndex == index
//                   ? selectedColor ?? bottomTheme.unselectedItemColor
//                   : unSelectedColor,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               '$label',
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: currentIndex == index
//                     ? selectedFontSize
//                     : unSelectedFontSize,
//                 color: currentIndex == index
//                     ? selectedColor ?? bottomTheme.unselectedItemColor
//                     : unSelectedColor,
//               ),
//             ),
//             currentIndex ==index && indicatorType == IndicatorType.bottom && enableDotIndicator==true
//                 ? DotIndicator(dotIndicatorColor: dotIndicatorColor,dotIndicatorWidth: dotIndicatorWidth,)
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DotIndicator extends StatefulWidget {
//   const DotIndicator({Key? key,required this.dotIndicatorColor,required this.dotIndicatorWidth}) : super(key: key);
//   final double dotIndicatorWidth;
//   final Color dotIndicatorColor;
//
//   @override
//   State<DotIndicator> createState() => _DotIndicatorState();
// }
//
// class _DotIndicatorState extends State<DotIndicator> with SingleTickerProviderStateMixin {
//   double opacityLevel = 1.0;
//   late AnimationController  _animationController;
//
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..forward();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _animationController,
//         builder: (BuildContext context, Widget? child) {
//           return Opacity(
//               opacity:_animationController.value,
//              child: child,
//           );
//         },
//         child: Container(
//           height: widget.dotIndicatorWidth,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: widget.dotIndicatorColor
//           ),
//         ));
//   }
// }
//
