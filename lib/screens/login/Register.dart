import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CashHelper.dart';
import '../../Shared/Components/Text.dart';
import '../../Shared/Components/color.dart';
import '../../components.dart';
import '../../cubit/auth cubit/authcubit_cubit.dart';
import '../home_layout_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage>  {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();


  bool show = false;
  IconData icon = FontAwesomeIcons.eyeSlash;
  String? nameValid(String? value){
    if(value!.isEmpty){
      return 'Enter Your Name';
    }
  }
  String? phoneValid(String? value){
    if(value!.isEmpty){
      return 'Enter Your phone';
    }
  }
  String? emailValid(String? value){
    if(value!.isEmpty){
      return 'Enter Your email';
    }
  }
  String? passwordValid(String? value){
    if(value!.isEmpty){
      return 'Enter Your password';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool show = false;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {

      if (state is RegisterSuccess){
        print('successssssssss');
        if(state.status == true){
          print('true');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeLayout();
          },));
          CashHelper.putData(key: 'token', value: state.token);  //search

        }else{
          print('false');
        }
      }

    },
    builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextFormField(
              style: TextStyle(
                color:AppColor.primeColor
              ),
              controller: nameController,
              cursorColor: AppColor.primeColor,


              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),
                ),

                enabledBorder: UnderlineInputBorder(

                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius:const  BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),



                ),


                hoverColor: Colors.red,
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Name',
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(
                  color: AppColor.primeColor,
                  fontWeight: FontWeight.bold,

                ),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.person_2_outlined,color: AppColor.primeColor,grade: 50),
                ),



              ),

            ),
            SizedBox(
                height: height*.03
            ),
            TextFormField(
              style: TextStyle(
                  color:AppColor.primeColor
              ),
              controller: phoneController,
              cursorColor: AppColor.primeColor,



              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),
                ),

                enabledBorder: UnderlineInputBorder(

                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),



                ),


                hoverColor: Colors.red,
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Phone',
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(
                  color: AppColor.primeColor,
                  fontWeight: FontWeight.bold,

                ),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.phone_outlined,color: AppColor.primeColor,grade: 50,),
                ),





              ),

            ),
            SizedBox(
                height: height*.03
            ),
            TextFormField(
              style: TextStyle(
                  color:AppColor.primeColor
              ),
              controller: emailController,
              cursorColor: AppColor.primeColor,


              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),
                ),

                enabledBorder: UnderlineInputBorder(

                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),



                ),


                hoverColor: Colors.red,
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Email',
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(
                  color: AppColor.primeColor,
                  fontWeight: FontWeight.bold,

                ),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.email_outlined,color: AppColor.primeColor,grade: 50),
                ),



              ),

            ),
            SizedBox(
                height: height*.03
            ),
            TextFormField(
              style: TextStyle(
                  color:AppColor.primeColor
              ),
              controller: passwordController,
              cursorColor: AppColor.primeColor,



              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),
                ),

                enabledBorder: UnderlineInputBorder(

                  borderSide: BorderSide(color: AppColor.primeColor,width: 2,),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(27), // Adjust this value for the shorter line
                  ),



                ),


                hoverColor: Colors.red,
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Password',
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(
                  color: AppColor.primeColor,
                  fontWeight: FontWeight.bold,

                ),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.security_outlined,color: AppColor.primeColor,grade: 50,),
                ),





              ),

            ),
            SizedBox(
                height: height*.03
            ),
            state is RegisterLoading? buildLoadingWidget(color: AppColor.primeColor):

            Center(
              child: GestureDetector(
                onTap: (){
                  print(nameController.text);
                  print(emailController.text);
                  print(passwordController.text);
                  print(phoneController.text);
                  cubit.postRegister(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text
                  );





                },
                child: Container(
                  height: height*.03,
                  width: width*.3,
                  color: Colors.transparent,
                  child: Center(child: BuildText(text: 'Register',color: AppColor.primeColor,bold: true,size: 25,)),

                ),
              ),
            )
          ],
        ),
      );
    },
);
  

  }
}
