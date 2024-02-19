import 'package:eccomerce_it_sharks_2/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/Components/Text.dart';
import 'cubit/app cubit/app_cubit.dart';
import 'components.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
            body:ListView.builder(
              itemCount: cubit.categorysModel!.data!.data!.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: height*0.2,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: height*0.2,
                            width: width,
                            child: buildImage(
                                image: cubit.categorysModel!.data!.data![index].image,
                                fit: 'cover'
                            ),
                          ),
                          Container(
                            height: height*0.2,
                            color: Colors.black54,
                          ),
                          Container(
                            height: height*0.2,
                            color: Colors.black54,
                          ),
                          Center(
                            child: BuildText(
                              text: cubit.categorysModel!.data!.data![index].name!,
                              color: Colors.white,
                              bold: true,
                              size: 30,
                            ),
                          )

                        ],
                      )
                    ),
                  );
                }
            ),
        );
      },
    );
  }
}
