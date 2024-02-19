import 'package:eccomerce_it_sharks_2/Shared/Components/color.dart';
import 'package:eccomerce_it_sharks_2/components.dart';
import 'package:eccomerce_it_sharks_2/shared/components/Text.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../cubit/app cubit/app_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int num = 1;

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
      child: cubit.cartModel == null || state is GetCartLoading ? buildLoadingWidget(color: AppColor.primeColor): cubit.cartModel!.data!.cartItems!.length ==0 ? Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: BuildText(text: 'Your Bag',color: AppColor.primeColor,size: 25,bold: true,),


                    ),
                  ),
                  Expanded(
                    flex: 10,
                      child:     SizedBox(
                        height: height*.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ListView.builder(itemCount:cubit.cartModel!.data!.cartItems!.length ,
                            itemBuilder: (context, index) {
                              return Slidable(
                                key: const ValueKey(0),
                                startActionPane: ActionPane(
                                  extentRatio: .5,
                                  motion: const ScrollMotion(),
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

                                    },
                                  ),
                                  children:  [
                                    SlidableAction(
                                      padding: const EdgeInsets.all(20),
                                      borderRadius: BorderRadius.circular(20),
                                      onPressed: (context) {
                                        if (mounted) {
                                          cubit.postChangeCart(id: cubit.cartModel!.data!.cartItems![index].product!.id!).then((value) {
                                            cubit.getHomeData();
                                            cubit.getCart();
                                          });
                                          setState(() {
                                            cubit.cartModel!.data!.cartItems!.removeAt(index); // حذف العنصر من القائمة
                                          });
                                        }




                                      },
                                      backgroundColor: AppColor.primeColor,
                                      foregroundColor: Colors.black,
                                      icon: Icons.add_shopping_cart,
                                      label: 'Remove From Cart',
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
                                            color: Colors.grey.withOpacity(.4 )
                                        ),
                                        height: height*.15,
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: height*.12,
                                              width: width*.13,
                                              decoration:  BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                  color: AppColor.primeColor,
                                                  width: 2

                                                ),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [

                                                  GestureDetector(onTap: (){
                                                    setState(() {
                                                      num ++;
                                                    });
                                                  },
                                                    child: Icon(Icons.add,color: AppColor.primeColor,),
                                                  ),
                                                  BuildText(text:' $num',color: AppColor.primeColor,),
                                                  GestureDetector(onTap: (){
                                                    setState(() {
                                                      num --;
                                                    });
                                                  },
                                                    child: Icon(Icons.remove,color: AppColor.primeColor,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(height: height*.13,
                                              width: width*.35,

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              child: Image.network(cubit.cartModel!.data!.cartItems![index].product!.image!,fit: BoxFit.fitWidth),
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: height*.1,
                                                    width: width*.3,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      BuildText(text: cubit.cartModel!.data!.cartItems![index].product!.name!,color: AppColor.primeColor,bold: true,size: 20,),
                                                      SizedBox(
                                                        height: height*.02,
                                                      ),
                                                      BuildText(text: ' ${cubit.cartModel!.data!.cartItems![index].product!.price!.toString()}   \$',color: AppColor.primeColor,bold: true,size: 20,)
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
                  Expanded(
                    flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.primeColor.withOpacity(.7)

                        ),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BuildText(text: ' Total price',color: AppColor.primeColor,bold: true,size: 20,),
                              BuildText(text: cubit.cartModel!.data!.total.toString(),color: AppColor.primeColor,bold: true,size: 30,)
                            ],
                          ),
                          Container(
                            height: height*.06,
                            width: width*.3,
                            decoration: BoxDecoration(
                              color: AppColor.primeColor,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Center(
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: width*.003,
                                  ),
                                  const Icon(Icons.attach_money),
                                  BuildText(text: 'Make order'),
                                  SizedBox(
                                    width: width*.003,
                                  ),
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                  ))











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