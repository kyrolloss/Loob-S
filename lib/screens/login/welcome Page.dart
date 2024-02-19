import 'package:eccomerce_it_sharks_2/screens/home_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/Text.dart';
import '../../Shared/Components/color.dart';
import '../../cubit/auth cubit/authcubit_cubit.dart';
import 'Login.dart';
import 'Register.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);

            return Scaffold(
            body: GestureDetector(
              onTap: () {
                // Hide keyboard when tapping outside of text fields
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black87],
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: width * 0.06,
                      left: width * 0.06,
                      top: height * 0.15,
                      bottom: height * 0.15,
                      child: Container(
                        height: height * 0.7, // Adjust as needed
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/view.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              TabBar(
                                controller: _tabController,
                                unselectedLabelColor: Colors.white,
                                indicatorColor: AppColor.primeColor,
                                tabs: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BuildText(
                                      text: 'Login',
                                      size: 20,
                                      color: AppColor.primeColor,
                                      bold: true,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BuildText(
                                      text: 'Sign Up',
                                      size: 20,
                                      color: AppColor.primeColor,
                                      bold: true,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * .09),
                              SizedBox(
                                height: height * 0.5, // Adjust as needed
                                child: TabBarView(
                                  controller: _tabController,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: LoginPage(),
                                    ),
                                    RegisterPage(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          }
      ),
    );
  }
}