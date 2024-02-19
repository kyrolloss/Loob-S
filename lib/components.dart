
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Shared/Components/color.dart';
import 'cubit/app cubit/app_cubit.dart';


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

Center buildLoadingWidget({double size =50,required color}) {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
      color: color,
      size: size,

    ),
  );
}

ClipRRect buildImage({required image,double radius=0,required String fit}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: CachedNetworkImage(
      fit: fit == 'fill'?  BoxFit.fill :
      fit == 'cover'? BoxFit.cover: BoxFit.contain,
      imageUrl: image,
      placeholder: (context,url) => buildLoadingWidget(color: AppColor.primeColor),
      errorWidget: (context,url,error) => Icon(Icons.error,color: Colors.red,),
    ),
  );
}




Container BuildSlider({
  required double width,
  required double height,
  required CarouselController carouselController,
  required AppCubit cubit,
  required int length,
  List<String>? items,
}){
  return Container(
    width: width,
    height: height,
    child: CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: buildImage(
            image:  items != null? items[index]: cubit.homeModel!.data!.banners![index].image,
            radius: 10,
            fit: 'fill',
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          if(items != null){
            cubit.changeCurrentIndexSlider(index);
          }
        },
        aspectRatio: 16 / 10,
        viewportFraction: 0.90,
        initialPage: 0,
        enableInfiniteScroll: true,
        //reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
      ),
    ),
  );
}