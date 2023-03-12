// import 'package:flutter/material.dart';
// import 'package:payment_app/payment_app/pages/payment_page.dart';
// import 'package:payment_app/payment_app/widgets/custom_button.dart';
// import 'package:payment_app/payment_app/widgets/menu_buttons.dart';
// import 'package:payment_app/payment_app/widgets/text_size.dart';
// import 'package:get/get.dart';
//
// import '../components/colors.dart';
// import '../controllers/data_controller.dart';
//
//
//
// class MyHomePage extends StatelessWidget {
//   final DataController _controller = Get.put(DataController());
//
//   @override
//   Widget build(BuildContext context) {
//     print(_controller.list);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: SizedBox(
//         height: height,
//         child: Stack(
//           children: [
//             _headSection(context),
//             Obx(() => (_controller.loading)
//                 ? _listBills(context)
//                 : Center(
//                     child: SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: CircularProgressIndicator(
//                           color: AppColor.mainColor,
//                         )))),
//             _payButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _headSection(context) {
//     return SizedBox(
//       height: 310,
//       // color: Colors.red,
//       child: Stack(
//         children: [
//           _mainBackground(),
//           _curveImage(),
//           _buttonContainer(context),
//           _textContainer(),
//         ],
//       ),
//     );
//   }
//
//   Widget _mainBackground() {
//     return Positioned(
//         bottom: 10,
//         right: 0,
//         left: 0,
//         child: Container(
//           height: 300,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/background.png'),
//                   fit: BoxFit.cover)),
//         ));
//   }
//
//   Widget _curveImage() {
//     return Positioned(
//         left: 0,
//         right: -20,
//         bottom: 5,
//         height: 130,
//         child: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/curve.png'),
//                   fit: BoxFit.fitWidth)),
//         ));
//   }
//
//   Widget _buttonContainer(context) {
//     return Positioned(
//         bottom: 15,
//         right: 25,
//         child: GestureDetector(
//           onTap: () {
//             showModalBottomSheet<dynamic>(
//               isScrollControlled: true,
//               barrierColor: Colors.transparent,
//               backgroundColor: Colors.transparent,
//               context: context,
//               builder: (context) => Container(
//                 height: MediaQuery.of(context).size.height - 235,
//                 child: Stack(
//                   children: [
//                     //background
//                     Positioned(
//                         bottom: 0,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height - 300,
//                           color: const Color(0xffeef1f4).withOpacity(0.7),
//                         )),
//                     Positioned(
//                       right: 45,
//                       child: Container(
//                         width: 60,
//                         height: 250,
//                         padding: const EdgeInsets.only(top: 10, bottom: 25),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(29),
//                           color: AppColor.mainColor,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             MenuButton(
//                               icon: Icons.cancel,
//                               iconColor: AppColor.mainColor,
//                               backgroundColor: Colors.white,
//                               onTap: () => Navigator.pop(context),
//                             ),
//                             MenuButton(
//                               icon: Icons.add,
//                               iconColor: AppColor.mainColor,
//                               backgroundColor: Colors.white,
//                               text: 'Add Bill',
//                               textColor: Colors.white,
//                               onTap: () => null,
//                             ),
//                             MenuButton(
//                               icon: Icons.history_sharp,
//                               iconColor: AppColor.mainColor,
//                               backgroundColor: Colors.white,
//                               text: 'History',
//                               textColor: Colors.white,
//                               onTap: () => null,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           child: Container(
//             height: 70,
//             width: 100,
//             decoration: const BoxDecoration(
//                 // color: Colors.red,
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/lines.png'))),
//           ),
//         ));
//   }
//
//   Widget _listBills(context) {
//     return Positioned(
//       top: 310,
//       left: 0,
//       right: 0,
//       bottom: 0,
//       child: MediaQuery.removePadding(
//         context: context,
//         removeTop: true,
//         child: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           itemCount: _controller.list.length,
//           padding: const EdgeInsets.only(bottom: 100),
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               height: 150,
//               margin: const EdgeInsets.only(top: 20, right: 20),
//               width: MediaQuery.of(context).size.width - 20,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                         color: Color(0xffd8dbe0),
//                         offset: Offset(1, 1),
//                         blurRadius: 20,
//                         spreadRadius: 10)
//                   ]),
//               child: Container(
//                 margin: const EdgeInsets.only(left: 18, top: 10),
//                 padding: const EdgeInsets.only(left: 18, top: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             //brand image
//                             Container(
//                               height: 70,
//                               width: 70,
//                               decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(10)),
//                                   image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage(
//                                         _controller.list[index]['img']),
//                                   ),
//                                   border:
//                                       Border.all(color: Colors.red, width: 2)),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             //id and name
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   _controller.list[index]['brand'],
//                                   style: TextStyle(
//                                       color: AppColor.mainColor,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(_controller.list[index]['id'],
//                                     style: TextStyle(
//                                         color: AppColor.idColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w700)),
//                               ],
//                             ),
//                             //sized text
//                           ],
//                         ),
//                         SizeText(
//                             text: _controller.list[index]['more'],
//                             color: AppColor.green),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //select
//                             GestureDetector(
//                               onTap: () {
//                                 _controller.list[index]['status'] =
//                                     !_controller.list[index]['status'];
//                                 //to set state and view new updates
//                                 _controller.list.refresh();
//                                 // print(_controller.list[index]['status']);
//                                 print(_controller.newList.length);
//                               },
//                               child: Container(
//                                 width: 80,
//                                 height: 30,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: _controller.list[index]['status']
//                                         ? AppColor.green
//                                         : AppColor.selectBackground),
//                                 child: Center(
//                                   child: Text(
//                                     'Select',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         color: !_controller.list[index]
//                                                 ['status']
//                                             ? AppColor.selectColor
//                                             : Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: Container()),
//                             Text(
//                               '\$ ${_controller.list[index]['due']}',
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               'Due in ${_controller.list[index]['date']}',
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   color: AppColor.idColor,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             const SizedBox(
//                               height: 23,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           height: 40,
//                           width: 5,
//                           decoration: BoxDecoration(
//                               color: AppColor.halfOval,
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   bottomLeft: Radius.circular(30))),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _payButton() {
//     return Positioned(
//       bottom: 20,
//       // left: MediaQuery.of(context).size.width / 5,
//       child: CustomButton(
//         text: 'Pay all bills',
//         onTap: () {
//           Get.to(() => const PaymentPage());
//         },
//       ),
//     );
//   }
//
//   Widget _textContainer() {
//     return Stack(
//       children: [
//         Positioned(
//             left: 0,
//             top: 100,
//             child: Text(
//               'My Bills',
//               style: TextStyle(
//                   fontSize: 70,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xff293952).withOpacity(0.7)),
//             )),
//         const Positioned(
//             left: 40,
//             top: 80,
//             child: Text(
//               'My Bills',
//               style: TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             )),
//       ],
//     );
//   }
// }
