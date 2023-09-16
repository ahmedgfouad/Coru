// import 'dart:async'; 
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';



// class MessagesScreen extends StatelessWidget {
//   const MessagesScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController messageController = TextEditingController();
//     return Scaffold(
//       body: SafeArea(
//         child: ChangeNotifierProvider(
//           create: (_) => MessageController(),
//           child: Column(
//             children: [
//               const AlemniAppBar(
//                 isHome: false,
//                 title: 'ChatGBT AI',
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 1.33.h,
//                       child: Consumer<MessageController>(
//                         builder: (context, provider, child) =>
//                             ListView.separated(
//                                 separatorBuilder: (context, index) =>
//                                     SizedBox(height: 15.h),
//                                 itemCount: provider.listOfMessageData.length,
//                                 itemBuilder: (context, index) {
//                                   // provider.changeIndexTheMessage(index);
//                                   return Column(
//                                     children: [
//                                       MessagePersonWidget(index: index),
//                                       SizedBox(height: 10.h),
//                                       MessageGptWidget(),
//                                     ],
//                                   );
//                                 }),
//                       ),
//                     ),
//                     Consumer<MessageController>(
//                       builder: (context, provider, child) => DefaultFormField(
//                         controller: messageController,
//                         tittle: "",
//                         hintText: "Enter your question",
//                         isAuth: false,
//                         width: 400,
//                         height: 50,
//                         suffix: Icons.send,
//                         isPassword: true,
//                         suffixButtonPressed: () {
//                           if (messageController.text.isNotEmpty) {
//                             provider.saveMessage(messageController.text);
//                             messageController.clear();
//                           }
//                         },
//                         validate: (val) {},
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }