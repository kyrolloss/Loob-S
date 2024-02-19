import 'package:eccomerce_it_sharks_2/screens/home_layout_screen.dart';
import 'package:eccomerce_it_sharks_2/screens/login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CashHelper.dart';
import 'cubit/app cubit/app_cubit.dart';
import 'cubit/auth cubit/authcubit_cubit.dart';
import 'dio_helper.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  final mymidget;

  String? token =CashHelper.getData(key: 'token');
  print(token);
  if(token == null){
     mymidget = LoginPage();
  }else{
     mymidget = HomeLayout();
  }
  runApp(MyApp(widget: mymidget,));
}


class MyApp extends StatelessWidget {
  final widget;
  const MyApp({required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthCubit()),
        BlocProvider(
            create: (context)=> AppCubit()..getHomeData()..getCategoryData()..getFavourite()..getCart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
