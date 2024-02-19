import 'package:eccomerce_it_sharks_2/Shared/Components/Text.dart';
import 'package:eccomerce_it_sharks_2/Shared/Components/color.dart';
import 'package:eccomerce_it_sharks_2/screens/cart_screen.dart';
import 'package:eccomerce_it_sharks_2/shared/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app cubit/app_cubit.dart';
import '../models/home_model.dart';

class ProductPage extends StatefulWidget {
  final Products product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) { var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  var cubit = AppCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [

                Container(
                  height: height*.9575,
                  width: width,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Positioned(bottom: 0,
                          child: Container(

                            width: width,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BuildText(text: 'price',color: AppColor.primeColor,bold: true,size: 20,),
                                      BuildText(text: '\$ ${widget.product.price} ',color: AppColor.primeColor,bold: true,size: 30,)
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        widget.product.inCart =! widget.product.inCart!;

                                      });
                                      cubit.postChangeCart(id: widget.product.id!);
                                    },

                                    child:  widget.product.inCart ==true ?  Container(
                                      height: height*.06,
                                      width: width*.3,
                                      decoration: BoxDecoration(
                                        color: AppColor.primeColor,
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_shopping_cart),
                                            BuildText(text: 'Added To Cart')
                                          ],
                                        ),
                                      ),
                                    ) : Container(
                                      height: height*.06,
                                      width: width*.3,
                                      decoration: BoxDecoration(
                                        color: AppColor.primeColor,
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_shopping_cart),
                                            BuildText(text: 'send To Cart')
                                          ],
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

                      ))
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [

                      Container(
                        height: height*.85,
                        decoration: BoxDecoration(
                            color: AppColor.primeColor,
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                      padding: const EdgeInsets.only(top: 70),
                                  child: SizedBox(
                                    height: height*.3,
                                    width: width,
                                    child: Container(
                                      height: height*.2,
                                      width: width,
                                      child:  Image.network(

                                        widget.product.image!,
                                        fit: BoxFit.contain,
                                      )
                                      ,
                                    )
                                  ),
                                ),
                                Positioned(
                                    top: 15,
                                    left: 10,
                                    child: IconButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, icon: const Icon(Icons.arrow_back))


                                ),
                                Positioned(
                                    top: 15,
                                    right: 10,
                                    child: IconButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return const CartScreen();
                                      },));
                                    }, icon: const Icon(Icons.shopping_cart))


                                ),






                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  BuildText(text: widget.product.name!,color:const Color(0xFF57574D),size: 20,bold: true,),
                                  SizedBox(height: height*.009,),
                                  BuildText(text: widget.product.description!,color:const Color(0xFF57574D).withOpacity(.7),size: 20,bold: true,maxLines: 6,),
                                ],
                              ),
                            ),



                          ],
                        ),

                      )
                    ],
                  ),
                )

            ],
            )

          ],
        ),
      ),
    );
  },
);
  }
}
