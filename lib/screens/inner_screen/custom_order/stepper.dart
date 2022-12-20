// import 'package:flutter/material.dart';
// import 'package:status_change/status_change.dart';
// import 'package:wasely/component/const_color.dart';
// class WaselyStep extends StatefulWidget {
//   const WaselyStep({Key? key}) : super(key: key);
//
//   @override
//   State<WaselyStep> createState() => _WaselyStepState();
// }
//
// class _WaselyStepState extends State<WaselyStep> {
//   @override
//   int index = 0;
//
//   // bool goNext = false;
//   // bool goPrevious = false;
//   int activeStep = 0; // Initial step set to 0.
//
//   // OPTIONAL: can be set directly.
//   int dotCount = 5;
//
//   @override
//   Widget build(BuildContext context) {
//     return StatusChange.tileBuilder(
//       theme: StatusChangeThemeData(
//         direction: Axis.vertical,
//         connectorTheme:
//         ConnectorThemeData(space: 1.0, thickness: 1.0),
//       ),
//       builder: StatusChangeTileBuilder.connected(
//         itemWidth: (_) =>
//         MediaQuery.of(context).size.width / 5,
//         contentWidgetBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Text(
//               'add content here',
//               style: TextStyle(
//                 color: Colors
//                     .blue, // change color with dynamic color --> can find it with example section
//               ),
//             ),
//           );
//         },
//         nameWidgetBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Text(
//               'your text ',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color:amberColor,
//               ),
//             ),
//           );
//         },
//         indicatorWidgetBuilder: (_, index) {
//           if (index <= 5) {
//             return DotIndicator(
//               size: 35.0,
//               border: Border.all(color: Colors.green, width: 1),
//               child: Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return OutlinedDotIndicator(
//               size: 30,
//               borderWidth: 1.0,
//               color: redColor,
//             );
//           }
//         },
//         lineWidgetBuilder: (index) {
//           if (index > 0) {
//             if (index == 1) {
//               final prevColor = amberColor;
//               final color = yellowColor;
//               var gradientColors;
//               gradientColors = [
//                 prevColor,
//                 Color.lerp(prevColor, color, 0.5)
//               ];
//               return DecoratedLineConnector(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: gradientColors,
//                   ),
//                 ),
//               );
//             } else {
//               return SolidLineConnector(
//                 color: yellowColor,
//               );
//             }
//           } else {
//             return null;
//           }
//         },
//         itemCount: 5,
//       ),
//     );
//   }
// }
//
// String info(int index) {
//   switch (index) {
//     case 1:
//       return 'تم استلام الطلب';
//
//     case 2:
//       return 'السائق في المطعم';
//
//     case 3:
//       return 'السائق في الطريق اليك';
//
//     case 4:
//       return 'تم استلام طلبك';
//
//   // Here, default corresponds to the index value = 0.
//     default:
//       return 'Welcome';
//   }
// }