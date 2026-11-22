import 'package:auth_app/cubit/auth_states.dart';
import 'package:auth_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CubitAuth extends Cubit<AuthStates>{
CubitAuth():super(AuthStatesinitial());
static CubitAuth get(context)=>BlocProvider.of(context);
var ispassword=true;
 IconData suffix = Icons.visibility;



void changpass(){
ispassword=!ispassword;
suffix= ispassword?Icons.visibility:Icons.visibility_off;
emit(IspassworsChaneState());
}

void login({
required email,
required password,
}){
emit(LogInLoadingState());
FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
  emit(LogInSuccessState());
}).catchError((error){
  emit(LogInErrorState(error.toString()));
});
}

void signUp({
  required email,
  required password,

}){
  emit(SignUpLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
    emit(SignUpSuccessState());
  }).catchError((error){
emit(SignUpErrorState(error.toString()));
  });
}






// void addTofirestor({
//     required email,
//   required name,
//   required phone,
// }){
//   UserModel user= UserModel(email: email, name: name, phone: phone);
// FirebaseFirestore.instance.collection('users').add(user.tomap()).then((value) {

// }).catchError((error){
// print('${error.toString()}');
// });
// }
// List<UserModel> users=[];
// void getUsers(){
//    users=[];
// FirebaseFirestore.instance.collection('users').get().then((value) {
// value.docs.forEach((element) {
//   users.add(UserModel.fromJson(element.data()));
// });
// emit(GetAllUsersSuccessState());
// }).catchError((error){

// });
// }
}
