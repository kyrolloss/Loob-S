import 'package:awesome_icons/awesome_icons.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:eccomerce_it_sharks_2/screens/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/Text.dart';
import '../../Shared/Components/color.dart';
import '../../Shared/Components/components.dart';
import '../../cubit/app cubit/app_cubit.dart';
import '../../components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(

          body: cubit.homeModel == null
              ? buildLoadingWidget(color: AppColor.secondColor)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      BuildSlider(
                        width: width,
                        height: height * 0.25,
                        carouselController: carouselController,
                        cubit: cubit,
                        length: cubit.homeModel!.data!.banners!.length,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Column(
                          children: [
                            buildItemRow(
                              text: 'Hot Sales',
                              function: () {},
                            ),
                            SizedBox(
                              height: height * 0.35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ProductPage(
                                              product: cubit.homeModel!.data!
                                                  .salesProducts![index],
                                            );
                                          },
                                        ));

                                      },
                                      child: SizedBox(
                                        width: width * 0.5,
                                        child: Card(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.2,
                                                width: width,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                        height: height * 0.2,
                                                        width: width,
                                                        child:
                                                        buildImage(
                                                            fit: 'cover',
                                                            radius: 12,
                                                            image: cubit
                                                                .homeModel!
                                                                .data!
                                                                .salesProducts![
                                                                    index]
                                                                .images![0])),
                                                    Positioned(
                                                      right: 0,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          padding:const  EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 3),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: BuildText(
                                                            text:
                                                                '${cubit.homeModel!.data!.salesProducts![index].discount!.toString()} %',
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: BuildText(
                                                  text: cubit
                                                      .homeModel!
                                                      .data!
                                                      .salesProducts![index]
                                                      .name!,
                                                  maxLines: 2,
                                                  overflow: true,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: BuildText(
                                                        text: cubit
                                                            .homeModel!
                                                            .data!
                                                            .salesProducts![
                                                                index]
                                                            .price!
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: true,
                                                        color:
                                                            AppColor.secondColor,
                                                        bold: true,
                                                        size: 25,
                                                      ),

                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    BuildText(
                                                      text: cubit
                                                          .homeModel!
                                                          .data!
                                                          .salesProducts![index]
                                                          .oldPrice!
                                                          .toString(),
                                                      overflow: true,
                                                      color: Colors.grey,
                                                      bold: true,
                                                      lineThrow: true,
                                                      size: 15,
                                                    ),
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cubit
                                                            .changeFavouriteInSales(
                                                                index: index);
                                                        cubit.postChangeFavourite(
                                                            id: cubit
                                                                .homeModel!
                                                                .data!
                                                                .salesProducts![
                                                                    index]
                                                                .id!);
                                                      },
                                                      child: Icon(
                                                        cubit
                                                                .homeModel!
                                                                .data!
                                                                .salesProducts![
                                                                    index]
                                                                .inFavorites!
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        color: cubit
                                                                .homeModel!
                                                                .data!
                                                                .salesProducts![
                                                                    index]
                                                                .inFavorites!
                                                            ? Colors.red
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: cubit
                                    .homeModel!.data!.salesProducts!.length,
                              ),
                            ),
                            buildItemRow(
                              text: 'Products',
                              function: () {},
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              color: Colors.grey,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: height * 0.38,
                                  crossAxisCount:
                                      2, // number of items in each row
                                  mainAxisSpacing: 1, // spacing between rows
                                  crossAxisSpacing:
                                      1, // spacing between columns
                                ),
                                padding: const EdgeInsets.all(1),
                                // padding around the grid
                                itemCount:
                                    cubit.homeModel!.data!.products!.length,
                                // total number of items
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ProductPage(
                                            product: cubit.homeModel!.data!
                                                .products![index],
                                          );
                                        },
                                      ));
                                    },
                                    child: buildProductItem(height, width,
                                        image: cubit.homeModel!.data!
                                            .products![index].image!,
                                        name: cubit.homeModel!.data!
                                            .products![index].name!,
                                        price: cubit.homeModel!.data!
                                            .products![index].price!
                                            .toString(),
                                        index: index,
                                        from: 'home',
                                        isFavourite: cubit.homeModel!.data!
                                            .products![index].inFavorites!,
                                        cubit: cubit,
                                        id: cubit.homeModel!.data!
                                            .products![index].id!),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Row buildItemRow({
    required text,
    required function,
  }) {
    return Row(
      children: [
        BuildText(
          text: text,
          bold: true,
          size: 25,
        ),
        const Spacer(),

      ],
    );
  }
}
