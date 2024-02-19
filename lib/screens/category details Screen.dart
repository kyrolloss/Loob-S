import 'package:eccomerce_it_sharks_2/Shared/Components/Text.dart';
import 'package:eccomerce_it_sharks_2/Shared/Components/color.dart';
import 'package:eccomerce_it_sharks_2/cubit/app%20cubit/app_cubit.dart';
import 'package:eccomerce_it_sharks_2/components.dart';
import 'package:eccomerce_it_sharks_2/screens/productScreen.dart';
import 'package:eccomerce_it_sharks_2/shared/components/product%20file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  late String text ;
CategoryDetailsScreen({required this.text});
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
    return Scaffold(
      backgroundColor: AppColor.primeColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        title: BuildText(text: text,),
      ),
      body: cubit.categoryDetailsModel ==null ? buildLoadingWidget(color: AppColor.primeColor):
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      ), itemCount: cubit.categoryDetailsModel!.data!.products!.length!
        ,itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductPage(product: cubit.categoryDetailsModel!.data!.products![index]);
              },));
            },
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,

              ),
              child: Column(
                children: [
                  SizedBox(height: height*.15,
                      width: width*.29,
                      child: Image.network(cubit.categoryDetailsModel!.data!.products![index].image!,fit: BoxFit.contain)),
              BuildText(text: cubit.categoryDetailsModel!.data!.products![index].name!,bold: true,),
              BuildText(text: 'price   ${cubit.categoryDetailsModel!.data!.products![index].price!.toString()}',bold: true,)

                ],
              ),

            ),
          ),
        );
      },)

    );
  },
);
  }
}
