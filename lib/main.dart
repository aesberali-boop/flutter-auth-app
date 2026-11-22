import 'package:auth_app/cubit/auth_cubit.dart';
import 'package:auth_app/cubit/auth_states.dart';
import 'package:auth_app/screens/first_screen.dart';
import 'package:auth_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitAuth(),
      child: BlocConsumer<CubitAuth,AuthStates>(
        listener: (context, state) {
          
        },
        builder:(context, state) => const MaterialApp(
          home: FirstPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
