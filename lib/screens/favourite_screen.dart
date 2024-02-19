import 'package:eccomerce_it_sharks_2/Shared/Components/color.dart';
import 'package:eccomerce_it_sharks_2/components.dart';
import 'package:eccomerce_it_sharks_2/shared/components/Text.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../cubit/app cubit/app_cubit.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return SafeArea(
          child: cubit.favouriteModel == null || state is GetFavouriteLoading ? buildLoadingWidget(color: AppColor.primeColor): cubit.favouriteModel!.data!.details!.length ==0 ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: BuildText(
                text: ' No Item Added',color: AppColor.primeColor,bold: true,size: 25,
              ),
            ),
          ) :
          Scaffold(
            backgroundColor: Colors.black,

            body:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Expanded(
                    flex: 10,
                    child:     SizedBox(
                      height: height*.8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ListView.builder(itemCount:cubit.favouriteModel!.data!.details!.length ,
                          itemBuilder: (context, index) {
                            return Slidable(

                              key: const ValueKey(0),
                              endActionPane:  ActionPane(
                                extentRatio: .5,

                                motion: const ScrollMotion(


                                ),
                                dismissible: DismissiblePane(
                                    onDismissed: () {
                                      if (mounted) {
                                        cubit.postChangeCart(id: cubit.cartModel!.data!.cartItems![index].product!.id!).then((value) {
                                          cubit.getHomeData();
                                          cubit.getCart();
                                        });
                                        setState(() {
                                          cubit.cartModel!.data!.cartItems!.removeAt(index); // حذف العنصر من القائمة
                                        });
                                      }

                                }),
                                children: [
                                  SlidableAction(

                                    borderRadius: BorderRadius.circular(20),
                                    padding: const EdgeInsets.all(50),

                                    onPressed: (context) {


                                      if (mounted) {
                                        cubit.postChangeFavourite(id: cubit.favouriteModel!.data!.details![index].product!.id!).then((value) {
                                          cubit.getHomeData();
                                          cubit.getFavourite();
                                        });
                                        setState(() {
                                          cubit.favouriteModel!.data!.details!.removeAt(index);
                                        });
                                      }



                                    },
                                    backgroundColor: AppColor.primeColor,
                                    foregroundColor: Colors.black,
                                    icon: Icons.favorite_outline,
                                    label: 'Remove From Your Favourites',

                                  ),

                                ],
                              ),


                              child:  ListTile(
                                  title: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                width: .5,
                                                color: Colors.grey
                                              )
                                          ),
                                          height: height*.15,
                                          width: width,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: height*.12,
                                                width: width*.12,
                                                decoration:  BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: AppColor.primeColor,
                                                        width: .2

                                                    ),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [

                                                    GestureDetector(onTap: (){},
                                                      child: Icon(Icons.add,color: AppColor.primeColor,),
                                                    ),
                                                    BuildText(text: 'num',color: AppColor.primeColor,),
                                                    GestureDetector(onTap: (){},
                                                      child: Icon(Icons.remove,color: AppColor.primeColor,),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(height: height*.13,
                                                width: width*.3,

                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                child: Image.network(cubit.favouriteModel!.data!.details![index].product!.image!,fit: BoxFit.cover),
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: width*.2,
                                                      child: Column(
                                                        children:
                                                       [
                                                         BuildText(text: cubit.favouriteModel!.data!.details![index].product!.name!,color: AppColor.primeColor,bold: true,size: 12,),
                                                         SizedBox(
                                                           height: height*.01,
                                                         ),
                                                         BuildText(text: cubit.favouriteModel!.data!.details![index].product!.price!.toString(),color: AppColor.primeColor,bold: true,size:15 ,)

                                                       ],
                                                      ),
                                                  )



                                                ],
                                              ),


                                            ],
                                          ),
                                        ),
                                      )
                                  )),
                            );
                          },),
                      ),
                    )
                ),












              ],
            ),



          ),
        );
      },
    );
  }
}

//Text('Product 1',style: TextStyle(
//                       color: AppColor.primeColor,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                       fontSize: 15
//                   ),),