import 'package:bloc/bloc.dart';
import 'package:eccomerce_it_sharks_2/screens/home/home_screen.dart';
import 'package:eccomerce_it_sharks_2/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../CashHelper.dart';
import '../../models/Change Cart/change_cart_model.dart';
import '../../models/Change Favourite/change_favourite_model.dart';
import '../../models/Favourite/get_favourite_model.dart';
import '../../models/Get Cart/get_cart_model.dart';
import '../../models/category details model.dart';
import '../../screens/cart_screen.dart';
import '../../models/category_model.dart';
import '../../dio_helper.dart';
import '../../end_points.dart';
import '../../screens/favourite_screen.dart';
import '../../models/home_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  List<Widget> myScreens = [
    HomeScreen(),
     CartScreen(),
     FavouriteScreen(),
     ProfileScreen(),

  ];

  List<Color>colorsScreen = [
    Colors.white,
    Colors.black,
    Colors.black,
Colors.white
  ];

  int screenColorIndex = 0;
  List <Icon> menuIcon = const
  [
     Icon(Icons.electric_bolt_sharp,color: Colors.yellow,),
    Icon(Icons.coronavirus_sharp,color: Colors.greenAccent,),
    Icon(Icons.sports_tennis_sharp,color: Colors.white),
    Icon(Icons.lightbulb_outline,color: Colors.yellow,),
    Icon(Icons.dry_cleaning_outlined,color: Colors.yellow,),
  ];

  int currentIndexScreen = 0;
  int currentIndexSlider = 0;

  static AppCubit get(context)=>BlocProvider.of(context);
  HomeModel? homeModel;
  CategorysModel? categorysModel;
  CategoryDetailsModel? categoryDetailsModel;
  FavouriteModel?favouriteModel;
  ChangeFavouriteModel?changeFavouriteModel;
  ChangeCartModel?changeCartModel;
  CartModel?cartModel;




  void changeCurrentIndexScreen(int index){
    currentIndexScreen = index;

    emit(ChangeCurrentIndexScreen());
    if (
    currentIndexScreen == 1
    ){
      getCart();
    }

    else if (currentIndexScreen == 2){
      getFavourite();
    }
  }
  void changeCurrentIndexSlider(int index){
    currentIndexSlider = index;
    emit(ChangeCurrentIndexSlider());
  }


  Future <void> getHomeData()async{
    emit(GetHomeLoading());
    DioHelper.getData(
        end_ponit: HOME,
      token: CashHelper.getData(key: 'token') ??'',
    ).then((value){
      homeModel = HomeModel.fromJson(value.data);//search
      emit(GetHomeSuccess());
    }).catchError((error)
    {
     emit(GetHomeError());
    }
    );

  }

  Future <void> getCategoryData()async{
    emit(GetCategoryLoading());
    DioHelper.getData(
      end_ponit: CATEGORY,
    ).then((value){
      categorysModel = CategorysModel.fromJson(value.data);//search
      emit(GetCategorySuccess());
    }).catchError((error)
    {
      emit(GetCategoryError());

    }
    );

  }

  void getCategoryDetails({required int id}) {
    categoryDetailsModel = null;
    emit(GetCategoryDetailsLoading());
    DioHelper.getData(
      end_ponit: 'products',
        token: CashHelper.getData(key: 'token')??'',
      query: {'category_id' :id,}

    ).then((value) {
      categoryDetailsModel = CategoryDetailsModel.fromJson(value.data);
      emit(GetCategoryDetailsSuccess());

    }).catchError((error){
      emit(GetCategoryDetailsError());
  });

  }






  Future<void>  postChangeFavourite({required int id})async{
    emit(ChangeFavouriteLoading());
    await DioHelper.postData(
      end_ponit: 'favorites',
      data: {
        'product_id' : id,
      },
      token: CashHelper.getData(key: 'token')?? '',
    ).then((value){
      changeFavouriteModel = ChangeFavouriteModel.fromJson(value.data);
      emit(ChangeFavouriteSuccess());

    }).catchError((error){
      print((error.toString()));
      emit(ChangeFavouriteError());

    });
  }


  void changeFavouriteInSales({required int index}){

    if(homeModel!.data!.salesProducts![index].inFavorites!){
      homeModel!.data!.salesProducts![index].inFavorites = false;
    }
    else
    {
      homeModel!.data!.salesProducts![index].inFavorites = true;
    }

    emit(ChangeFavourite());
  }


  void changeFavouriteInHomeProduct({required int index}){

    if(homeModel!.data!.products![index].inFavorites!){
      homeModel!.data!.products![index].inFavorites = false;
    }
    else
    {
      homeModel!.data!.products![index].inFavorites = true;
    }

    emit(ChangeFavourite());
  }

  void changeFavouriteInCategoryProduct({required int index}){

    if(categoryDetailsModel!.data!.products![index].inFavorites!){
      categoryDetailsModel!.data!.products![index].inFavorites = false;
    }
    else
    {
      categoryDetailsModel!.data!.products![index].inFavorites = true;
    }

    emit(ChangeFavourite());
  }

  void changeFavouriteInFavouriteScreen({required int index}){

    if(cartModel!.data!.products![index].inFavorites!){
      categoryDetailsModel!.data!.products![index].inFavorites = false;
    }
    else
    {
      categoryDetailsModel!.data!.products![index].inFavorites = true;
    }

    emit(ChangeFavourite());
  }




  Future<void> getFavourite()async{
    emit(GetFavouriteLoading());
    DioHelper.getData(
      end_ponit: 'favorites',
      token: CashHelper.getData(key: 'token')??'',
    ).then((value){

      favouriteModel = FavouriteModel.fromJson(value.data);
      emit(GetFavouriteSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetFavouriteError());
    });
  }

  Future<void>  postChangeCart({required int id})async{
    emit(ChangeCartLoading());
    await DioHelper.postData(
      end_ponit: 'carts',
      data: {
        'product_id' : id,
      },
      token: CashHelper.getData(key: 'token')?? '',
    ).then((value){
      changeCartModel = ChangeCartModel.fromJson(value.data);
      emit(ChangeCartSuccess());

    }).catchError((error){
      print((error.toString()));
      emit(ChangeCartError());

    });
  }


  Future<void> getCart()async{
    emit(GetCartLoading());
    DioHelper.getData(
      end_ponit: 'carts',
      token: CashHelper.getData(key: 'token')??'',
    ).then((value){

      cartModel = CartModel.fromJson(value.data);
      emit(GetCartSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetCartError());
    });
  }






}
