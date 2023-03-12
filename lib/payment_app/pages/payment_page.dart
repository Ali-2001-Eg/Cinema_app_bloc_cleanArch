// import 'package:flutter/material.dart';
// import 'package:payment_app/payment_app/pages/payment_page.dart';
// import 'package:payment_app/payment_app/widgets/custom_button.dart';
// import 'package:payment_app/payment_app/widgets/menu_buttons.dart';
// import 'package:payment_app/payment_app/widgets/text_size.dart';
// import 'package:get/get.dart';
//
// import '../components/colors.dart';
// import '../controllers/data_controller.dart';
// class PaymentPage extends StatelessWidget {
//
//
//   const PaymentPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     final DataController _controller = Get.put(DataController());
//     return Scaffold(
//       body: Container(
//         height: height,
//         width: width,
//         padding: const EdgeInsets.only(top: 60,right: 20,left: 20),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/images/payment.png'),
//               fit: BoxFit.fill),
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: double.maxFinite,
//               height: height*0.1,
//               decoration:  BoxDecoration(
//                 border: Border.all(color: Colors.white,width: 2),
//                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
//                 image: const DecorationImage(
//                     image: AssetImage('assets/images/success.png'),
//                     fit: BoxFit.fitWidth),
//               ),
//             ),
//             SizedBox(height: height*0.045,),
//             Text(
//               'Success !',
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.mainColor),
//             ),
//             SizedBox(height: height*0.01,),
//             Text(
//               'Payment is completed for 2 bills',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.idColor),
//             ),
//             SizedBox(height: height*0.045,),
//             Container(
//               height: 160,
//               width: 350,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5))
//               ),
//               child: MediaQuery.removePadding(
//                 context: context,
//                 removeTop: true,
//                 removeBottom: true,
//                 child: ListView.builder(
//                  itemCount: _controller.list.length,
//                  itemBuilder: (context, index) =>  Container(
//                     padding: const EdgeInsets.only(top:10),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 width: 50,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: AppColor.green
//                                 ),
//                                 child: const Icon(Icons.done,color: Colors.white,size: 38,),
//                               ),
//
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     _controller.list[index]['brand'],
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColor.mainColor),
//                                   ),
//                                   const SizedBox(height: 10,),
//                                   Text(
//                                     _controller.list[index]['id'],
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColor.idColor ),
//                                   ),
//                                 ],
//                               ),
//
//                               Column(
//                                 children: [
//                                   const Text(
//                                     '',
//                                   ),SizedBox(height: 10,),
//                                   Text(
//                                     '\$ ${_controller.list[index]['due']}',
//
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         color: AppColor.mainColor),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         (index==_controller.list.length-1)?Container(): Divider(color: Colors.grey.withOpacity(0.5),thickness: 2,),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: height*0.09,),
//             Column(
//               children: [
//                 Text(
//                   'Total Amount',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.idColor),
//                 ),SizedBox(height: 10,),
//                 Text(
//                   '\$ 2840.00',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: AppColor.mainColor),
//                 ),
//               ],
//
//
//             ),
//             SizedBox(height: height*0.14,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MenuButton(icon: Icons.share,text: 'share',textColor: AppColor.mainColor,iconColor: Colors.white,iconSize: 30,),
//                 MenuButton(icon: Icons.print,text: 'print',textColor: AppColor.mainColor,iconColor: Colors.white,iconSize: 30,)
//               ],
//             ),
//             SizedBox(height: height*0.05,),
//             CustomButton(text: 'Done',backgroundColor: Colors.transparent,textColor: AppColor.mainColor,onTap: ()=>Get.back(),),
//           ],
//         ),
//       ),
//     );
//   }
// }
