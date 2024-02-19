import 'package:awesome_icons/awesome_icons.dart';
import 'package:eccomerce_it_sharks_2/screens/cart_screen.dart';
import 'package:eccomerce_it_sharks_2/screens/category%20details%20Screen.dart';
import 'package:eccomerce_it_sharks_2/shared/components/Text.dart';
import 'package:eccomerce_it_sharks_2/shared/components/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../cubit/app cubit/app_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var cubit = AppCubit.get(context);


        return SafeArea(
          child: SideMenu(
            background: AppColor.primeColor,
            closeIcon: Icon(Icons.exit_to_app,color: AppColor.secondColor,),
            menu: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cubit.getCategoryDetails(
                        id: cubit.categorysModel!.data!.data![index].id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CategoryDetailsScreen(
                          text: cubit.categorysModel!.data!.data![index].name!,
                        );
                      }),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: AppColor.secondColor.withOpacity(.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Icon(cubit.menuIcon[index].icon),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          BuildText(
                            text: cubit.categorysModel!.data!.data![index].name!,
                            size: 15,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            key: _sideMenuKey,
            type: SideMenuType.slideNRotate,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: cubit.colorsScreen[cubit.screenColorIndex],
                title: BuildText(
                  text: 'LooB s',
                  bold: true,
                  size: 25,
                ),
                centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: const  Icon(Icons.menu),
                    onPressed: () {
                      final _state = _sideMenuKey.currentState;
                      if (_state!.isOpened)
                        _state.closeSideMenu();
                      else
                        _state.openSideMenu();
                    },
                  ),
                ),
                elevation: 0,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 10.0,right: 5,left: 5,bottom: 5),
                  child: Container(
                    height: height*.15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.secondColor,AppColor.primeColor,AppColor.secondColor,AppColor.primeColor,AppColor.secondColor]

                      ),
                      borderRadius: BorderRadius.circular(50)

                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const CartScreen();
                        },));
                      },
                      icon:const  Icon(Icons.shopping_cart),
                    ),
                  ),

                ],
              ),
              body: cubit.myScreens[cubit.currentIndexScreen],
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                child: GNav(

                  selectedIndex: cubit.currentIndexScreen,
                  backgroundColor: AppColor.primeColor,
                  haptic: true,
                  tabBorderRadius: 10,
                  duration: const Duration(milliseconds: 400),
                  gap: width * 0.03,
                  color: Colors.grey[700],
                  activeColor: AppColor.primeColor,
                  iconSize: 24,

                  tabBackgroundColor: AppColor.secondColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.015),
                  tabs: const [
                    GButton(
                      icon: FontAwesomeIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.shoppingBasket,
                      text: 'Cart',
                    ),
                    GButton(
                      icon: FontAwesomeIcons.heart,
                      text: 'Favorite',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Setting',
                    ),
                  ],
                  onTabChange: (index) {
                    cubit.changeCurrentIndexScreen(index);
                    print(cubit.currentIndexScreen);
                    cubit.screenColorIndex=index;
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
