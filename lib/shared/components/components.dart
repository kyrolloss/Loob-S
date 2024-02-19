
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../../cubit/app cubit/app_cubit.dart';
import '../../components.dart';
import 'Text.dart';
import 'color.dart';


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToToFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

SnackBar buildSnackBar2(
    {required int num, required String title, required String message , milSecond =3000}) {
  return SnackBar(
    duration: Duration(milliseconds: milSecond),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: num == 0
          ? ContentType.failure
          : num == 1
          ? ContentType.success
          : ContentType.warning,
    ),
  );
}





Container buildProductItem(
    double height,
    double width,
    {
      required String image,
      required String name,
      required String price,
      required int index,
      required String from,
      required bool isFavourite,
      required AppCubit cubit,
      required int id,
    }
    ) {

  return Container(
    color: Colors.white,
    child: Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height*.15,
          child:
            Image.network(image,fit: BoxFit.scaleDown,)
          // buildImage(
          //   fit: 'c',
          //   image: image,
          // ),

        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          height: height * 0.07,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BuildText(
              text: name,
              maxLines: 2,
              bold: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              BuildText(
                text:
                '$price  EGP',
                bold: true,
                color: AppColor.secondColor,
                size: 20,
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){


                  if(from == 'home'){

                    cubit.changeFavouriteInHomeProduct(index: index);
                    cubit.postChangeFavourite(id: id);

                  }
                  else
                  {
                    cubit.changeFavouriteInCategoryProduct(index: index);
                    cubit.postChangeFavourite(id: id).then((value){
                      cubit.getHomeData();
                    });
                  }
                },
                child: Icon(
                  isFavourite? Icons.favorite : Icons.favorite_border,
                  color: isFavourite? Colors.red: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}