import 'package:awesome_icons/awesome_icons.dart';
import 'package:eccomerce_it_sharks_2/screens/home_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CashHelper.dart';
import '../../Shared/Components/Text.dart';
import '../../Shared/Components/color.dart';
import '../../components.dart';
import '../../cubit/auth cubit/authcubit_cubit.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var  emailController = TextEditingController();
  var  passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool show = false;
  IconData icon = FontAwesomeIcons.eyeSlash;
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

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TabBarIndicatorSize indicatorSize = TabBarIndicatorSize.label;

    return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is LoginSuccess){
        if(state.status == true){

          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return HomeLayout(); }));
          CashHelper.putData(key: 'token', value: state.token);

          print(CashHelper.getData(key: 'token'));//search
        }
      }

      // TODO: implement listener
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
                    contentPadding: const EdgeInsets.all(0),
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
                SizedBox(height: height*.03),
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
                      borderRadius:const  BorderRadius.vertical(
                        bottom: Radius.circular(27), // Adjust this value for the shorter line
                      ),



                    ),


                    hoverColor: Colors.red,
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.all(0),
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
                SizedBox(height: height*.09),
                state is LoginLoading?buildLoadingWidget(color: AppColor.primeColor
                ):

                Center(
                  child: GestureDetector(
                    onTap: (){
                      cubit.postLogin(email: emailController.text, password: passwordController.text);
                    },
                    child: Container(
                      height: height*.03,
                      width: width*.3,
                      color: Colors.transparent,
                      child: Center(child: BuildText(text: 'Login',color: AppColor.primeColor,bold: true,size: 25,)),

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

