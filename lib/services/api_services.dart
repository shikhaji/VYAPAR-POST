
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vyapar_post/models/get_all_category_model.dart';
import 'package:vyapar_post/models/get_city_model.dart';
import 'package:vyapar_post/models/get_faq_model.dart';
import 'package:vyapar_post/models/get_plan_model.dart';
import 'package:vyapar_post/models/get_state_model.dart';
import 'package:vyapar_post/models/my_transaction_model.dart';
import 'package:vyapar_post/models/profile_contant_model.dart';
import 'package:vyapar_post/routs/arguments.dart';
import 'package:vyapar_post/services/shared_preferences.dart';
import '../API/dio_client.dart';
import '../API/url.dart';

import '../models/get_all_post_model.dart';
import '../models/get_current_balance.dart';
import '../models/login_model.dart';
import '../routs/app_routs.dart';
import '../utils/function.dart';
import '../utils/loader.dart';
import '../views/Auth/login_screen.dart';

class ApiService {
  ApiClient apiClient = ApiClient();
  Dio dio = Dio();


  //----------------------------SIGNUP API-----------------------//
  Future signUp(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.signUp,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'Sign Up Successfully...',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        Navigator.pushNamedAndRemoveUntil(
            context, Routs.loginScreen, (route) => false);

        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------LOGIN API-----------------------//

  Future<LoginModel?> login(
      BuildContext context, {
        FormData? data,
        String? phoneNumber,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.login,
          data: data);
      print("1");
      LoginModel responseData = LoginModel.fromJson(response.data);
      if (responseData.message == "ok" ) {
        print("2");
        Preferances.setString("userId", responseData.id);
        Preferances.setString("Token", responseData.token);
        Loader.hideLoader();
        CommonFunctions.toast("Login Success");



        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        CommonFunctions.toast("Invalid Login Credential");
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------UPDATE PROFILE API-----------------------//
  Future updateProfile(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.updateProfile,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'update Successfully...',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        Navigator.pushNamedAndRemoveUntil(
            context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 0), (route) => false);

        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------RESET  Password API-----------------------//
  Future forgetPassword(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.forgetPassword,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'password changed Successfully...',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        Navigator.pushNamedAndRemoveUntil(
            context, Routs.loginScreen,arguments: SendArguments(bottomIndex: 0), (route) => false);

        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------ALL POST API-----------------------//

  Future<GetAllPostModel?> getAllPost(
      BuildContext context,
      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getAllPost);
      print("1");
      GetAllPostModel responseData = GetAllPostModel.fromJson(response.data);
      if (responseData.status == 200 ) {
        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------CURRENT BALANCE API-----------------------//

  Future<GetCurrentBalanceModel?> getCurrentBalance(
      BuildContext context,{
        FormData? data,

      }
      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getCurrentBalance,data: data);
      print("1");
      if (response.statusCode == 200 ) {
        GetCurrentBalanceModel responseData = GetCurrentBalanceModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------GET ALL CATEGORY API-----------------------//

  Future<GetAllCategoryModel?> getAllCatgory(
      BuildContext context,
      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getAllCategory);
      print("1");
      GetAllCategoryModel responseData = GetAllCategoryModel.fromJson(response.data);
      if (responseData.status == 200 ) {
        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------PROFILE CONTANT API-----------------------//

  Future<ProfileContantModel?> profileContant(
    BuildContext context,{
    FormData? data,

    }
    ) async {
    try {
    Loader.showLoader();
    Response response;
    response = await dio.post(EndPoints.profileContant,data: data);
    print("1");

    if (response.statusCode == 200 ) {
      print("2");
      ProfileContantModel responseData = ProfileContantModel.fromJson(response.data);

    Loader.hideLoader();
    print("response data: ${responseData}");
    return responseData;
    } else {
    print("3");
    Loader.hideLoader();
    throw Exception(response.data);
    }
    } on DioError catch (e) {
    Loader.hideLoader();
    print("4");
    debugPrint('Dio E  $e');
    } finally {
    print("5");
    Loader.hideLoader();
    }
    return null;
    }

    //----------------------------ADD WALLET API-----------------------//
    Future addWallet(
    BuildContext context, {
    FormData? data,
    }) async {
    try {
    Loader.showLoader();
    Response response;
    response = await dio.post(EndPoints.addWallet,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'balance added.....',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 0), (route) => false);

        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------GET FAQ API-----------------------//

  Future<GetFaqModel?> getFaq(
      BuildContext context,

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getFaq);
      print("1");
      if (response.statusCode == 200 ) {
        GetFaqModel responseData = GetFaqModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------GET STATE API-----------------------//

  Future<GetStateModel?> getStateModel(
      BuildContext context,

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getState);
      print("1");
      if (response.statusCode == 200 ) {
        GetStateModel responseData = GetStateModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------GET CITY API-----------------------//

  Future<GetCityModel?> getCityModel(
      BuildContext context,{
        FormData? data,

      }

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getCity,data: data);
      print("1");
      if (response.statusCode == 200 ) {
        GetCityModel responseData = GetCityModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------MY TRANSACTION API-----------------------//

  Future<MyTransactionModel?> myTransactionModel(
      BuildContext context,{
        FormData? data,

      }

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.myTransaction,data: data);
      print("1");
      if (response.statusCode == 200 ) {
        MyTransactionModel responseData = MyTransactionModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------GET PLAN API-----------------------//

  Future<GetPlanModel?> getPlanModel(
      BuildContext context,

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getPlan);
      print("1");
      if (response.statusCode == 200 ) {
        GetPlanModel responseData = GetPlanModel.fromJson(response.data);

        print("2");
        Loader.hideLoader();
        return responseData;
      } else {
        print("3");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("4");
      debugPrint('Dio E  $e');
    } finally {
      print("5");
      Loader.hideLoader();
    }
    return null;
  }
  //----------------------------ADD POST API-----------------------//
  Future addPost(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.addPost,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'uploaded Successfully...',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 0), (route) => false);

        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }
  //----------------------------VERIFY MOBILE API-----------------------//
  Future verifyMobile(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.verifyMobile,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
          //   "Auth-Key": 'simplerestapi',
          // }),
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'verified Successfully...',
          backgroundColor: Colors.grey,
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        // Navigator.pushNamed(context, Routs.otpVerificationScreen,
        //     arguments: SendArguments(
        //         phoneNumber: _phone.text.trim(),
        //         otpStatus: 0
        //     ) );


        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }




}

