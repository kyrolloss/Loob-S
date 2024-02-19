import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../dio_helper.dart';
import '../../end_points.dart';
import '../../models/authentication_model.dart';

part 'authcubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthcubitInitial());

  static AuthCubit get(context)=>BlocProvider.of(context);
  AuthenticationModel?authenticationModel;

  Future<void> postRegister({
    required name,
    required email,
    required password,
    required phone,
  })async{
    emit(RegisterLoading());
    DioHelper.postData(
      end_ponit: REGISTER,
      data: {
        'name':name,
        'phone':phone,
        'email':email,
        'password':password,
      },
    ).then((value){
      authenticationModel = AuthenticationModel.fromJson(value.data);//search
      print(value.data);
      emit(RegisterSuccess(
          status: authenticationModel!.status!,
          message: authenticationModel!.message!,
          token: authenticationModel!.status!?authenticationModel!.data!.token!:null
      ));
    }).catchError((error){
      emit(RegisterError());
    });
  }


  Future<void> postLogin({
    required email,
    required password,
  })async{
    emit(LoginLoading());
    DioHelper.postData(
      end_ponit: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value){
      authenticationModel = AuthenticationModel.fromJson(value.data);//search
      print(value.data);
      emit(LoginSuccess(
          status: authenticationModel!.status!,
          message: authenticationModel!.message!,
          token: authenticationModel!.status!?authenticationModel!.data!.token!:null
      ));
    }).catchError((error){
      emit(LoginError());
    });
  }
}