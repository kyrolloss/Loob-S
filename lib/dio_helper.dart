import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper{
static late Dio dio;

 static void init(){
   dio = Dio(
     BaseOptions(
       baseUrl: baseurl,
       receiveDataWhenStatusError: true,
     )
   );
 }


 static Future<Response> postData({
    required String end_ponit,
     Map<String,dynamic>?data,  // login and register
     Map<String,dynamic>?query, //like country = us
   String? token,
})async{
   dio.options.headers={
     'lang': 'en',
     'Content-type' : 'application/json',
     'Authorization' : token??'',
   };
   return await dio.post(
     end_ponit,
     data: data,
     queryParameters: query,
   );
 }


static Future<Response> getData({
   String? end_ponit,
    Map<String,dynamic>?
    query, //like country = us
  String? token,
})async{
  dio.options.headers={
    'lang': 'en',
    'Content-type' : 'application/json',
    'Authorization' : token??'',
  };
  return await dio.get(
    end_ponit!,
    queryParameters: query,
  );
}



static Future<Response> putData({
  required String end_ponit,
  required  Map<String,dynamic>?data,  // login and register
  required  Map<String,dynamic>?query, //like country = us
  String? token,
})async{
  dio.options.headers={
    'lang': 'en',
    'Content-type' : 'application/json',
    'Authorization' : token??'',
  };
  return await dio.put(
    end_ponit,
    data: data,
    queryParameters: query,
  );
}



static Future<Response> deleteData({
  required String end_ponit,
  required  Map<String,dynamic>?data,  // login and register
    Map<String,dynamic>?query, //like country = us
  String? token,
})async{
  dio.options.headers={
    'lang': 'en',
    'Content-type' : 'application/json',
    'Authorization' : token??'',
  };
  return await dio.delete(
    end_ponit,
    data: data,
    queryParameters: query,
  );
}

}