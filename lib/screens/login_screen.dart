import 'package:auth_app/cubit/auth_cubit.dart';
import 'package:auth_app/cubit/auth_states.dart';
import 'package:auth_app/screens/home_screen.dart';
import 'package:auth_app/screens/signup_screen.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {


  LogInScreen({super.key});
final textformkey =GlobalKey<FormState>();
var yara=TextEditingController();
var ali=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CubitAuth,AuthStates>(
          listener: (context, state) {
            if(state is LogInSuccessState){
               Fluttertoast.showToast(
              msg: 'اهلا وسهلا ',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        
            }
            if(state is LogInErrorState){
               Fluttertoast.showToast(
              msg: '${state.error}',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        
            }
          },
         builder:(context, state) =>  Scaffold(
              backgroundColor: Colors.transparent,
            body: Form(
              key:textformkey ,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: yara,
                         decoration: InputDecoration(
                        label:const Text('email'),
                        prefixIcon:const Icon(Icons.mail_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                              
                          
                          focusedBorder:const OutlineInputBorder(
                            borderSide:BorderSide(color: Color.fromARGB(255, 18, 0, 0)) ,
                            
                        ),
                        errorBorder:const OutlineInputBorder(
                      
                            borderSide:BorderSide(color: Colors.red) ),
                      filled: true,
                        
                           ),
                           validator: (value) {
                            if (value!.isEmpty) {
                              return 'email address must not be null';
                            }
                            return null;
                          },
                          
                      ),
                   const SizedBox(height: 20,),
                     TextFormField(
                      controller:ali ,
                       obscureText: CubitAuth.get(context).ispassword,
                        decoration: InputDecoration(
                       label:const Text('password'),
                       prefixIcon:const Icon(Icons.lock),
                       suffixIcon: IconButton(icon:Icon(CubitAuth.get(context).suffix),onPressed: (){
                         CubitAuth.get(context).changpass();
                       },),
                     
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                             
                         
                         focusedBorder:const OutlineInputBorder(
                           borderSide:BorderSide(color: Color.fromARGB(255, 18, 0, 0)) ,
                           
                       ),
                       errorBorder:const OutlineInputBorder(
                      
                           borderSide:BorderSide(color: Colors.red) ),
                       filled: true,
                       
                          ),
                          validator: (value) {
                           if (value!.isEmpty) {
                             return 'password must not be null';
                           }
                           return null;
                         },
                     ),
                    
                 const   SizedBox(height: 20,),
                       Center(
                         child: Container(
                                 
                           decoration: BoxDecoration(  
                                  color:const Color.fromARGB(255, 255, 197, 82),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow:const [
                                    BoxShadow(
                                     color: Colors.grey ,
                                     blurRadius: 2.0,
                                   )
                                  ]
                                  ),
                                  
                                 // decoration:  BoxDecoration(border: Border.all(color: Colors.red)),
                                 width: MediaQuery.of(context).size.width*0.7,
                                 height: MediaQuery.of(context).size.width*0.08,
                                 
                                 
                                 child: TextButton(
                                  onPressed: (){
                                  if(textformkey.currentState!.validate()){
CubitAuth.get(context).login(email: yara.text, password: ali.text);
                                  }
                                 }, child:const Text('LOG IN',style: TextStyle(color:Colors.black 
                                 , fontSize: 30.0),
                                 ),
                                 ),
                                 ),
                       ),
              const  SizedBox(height: 10,),
                       InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) =>SignUpScreen() )));
                          },
                          child: Text('don\'t have an account??',style: TextStyle(color: Colors.blue[200]),))
                    ],
                  ),
                ),
              ),
            ),
          ),
       
      );
  
  }
}