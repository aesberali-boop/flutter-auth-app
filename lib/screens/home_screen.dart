// import'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'model/UserModel.dart';
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text('all users'),
//         centerTitle: true,
//         backgroundColor: Colors.amberAccent,
//       ),
//       body: BlocConsumer<CubitAuth, AuthStates>(
//         listener: (context, state) {
          
//         },
//         builder:(context,state)=> ListView.separated(
//                   itemBuilder: (context, i) =>userItem(context,CubitAuth.get(context).users[i]),
                  
//                     separatorBuilder: ((context, index) =>const Divider()),
//                   itemCount:CubitAuth.get(context).users.length  ,
//                 ),
//       ),
     
//     );
//   }



// }

// Widget userItem(context, UserModel user) =>  Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//               const  Padding(
//                   padding:  EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.amber,
//                   ),
//                 ),
//                const Text(
//                   overflow: TextOverflow.ellipsis,
//                   'User Name :   ',
//                   style: TextStyle(
//                   ),
//                 ),
//                 Text('${user.name}'),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                const Padding(
//                   padding:  EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.mail,
//                     color: Colors.amber,
//                   ),
//                 ),
//                 Text(
//                   overflow: TextOverflow.ellipsis,
//                   'User Email :  ',
//                   style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .025,
//                   ),
//                 ),
//                 Text('${user.email}')
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//               const  Padding(
//                   padding:  EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.mobile_screen_share_outlined,
//                     color: Colors.amber,
//                   ),
//                 ),
//               const  Text(
//                   overflow: TextOverflow.ellipsis,
//                   'User Number :  ',
//                   style: TextStyle(
//                   ),
//                 ),
//                 Expanded(
//                   child: Text('${user.phone}'),
//                 ),
//               ],
//             ),
//           ),
         
//         ],
    
//     );

