import 'package:auth_app/cubit/auth_cubit.dart';
import 'package:auth_app/cubit/auth_states.dart';
import 'package:auth_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SignUpScreen extends StatelessWidget {
  final textformkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitAuth(),
      child: BlocConsumer<CubitAuth, AuthStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Fluttertoast.showToast(
                msg: 'تم تسجيل الحساب بنجاح ',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => LogInScreen())));
          }
           if (state is SignUpErrorState) {
            Fluttertoast.showToast(
                msg: ' ${state.error} ',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
        }},
        builder: (context, state) => Scaffold(
          body: Form(
            key: textformkey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: const Text('email'),
                        hintText: '@gmail.com',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        filled: true,
                      ),
                      validator: (x) {
                        if (x!.isEmpty) {
                          return 'email address must not be null';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: CubitAuth.get(context).ispassword,
                      decoration: InputDecoration(
                        label: const Text('password'),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(CubitAuth.get(context).suffix),
                          onPressed: () {
                            CubitAuth.get(context).changpass();
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be null';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: const Text('User Name'),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User Name must not be null';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: const Text('Phone Number'),
                        prefixIcon: const Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 8 ||
                            value.length > 10) {
                          return 'Phone Number must be 10 characters long and not null';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 197, 82),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                              )
                            ]),

                        // decoration:  BoxDecoration(border: Border.all(color: Colors.red)),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.width * 0.08,

                        child: TextButton(
                          onPressed: () {
CubitAuth.get(context) .signUp(email: emailController.text, password: passwordController.text) ;                        if (textformkey.currentState!.validate()) {
                             
                            }
                            
                          },
                          child: ConditionalBuilder(
                            condition: state is SignUpLoadingState,
                            builder: (context) => CircularProgressIndicator(),
                            fallback: (context)=>const Text(
                                'SIGN UP',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 30.0),
                              ),
                          ),
                        
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LogInScreen())));
                        },
                        child: Text(
                          'back to log in',
                          style: TextStyle(color: Colors.blue[200]),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
