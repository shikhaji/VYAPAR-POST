
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vyapar_post/services/shared_preferences.dart';
import '../API/dio_client.dart';
import '../API/url.dart';
import '../models/get_all_category_model.dart';
import '../models/get_all_comment_model.dart';
import '../models/get_all_post_by_category_model.dart';
import '../models/get_all_post_model.dart';
import '../models/get_city_model.dart';
import '../models/get_current_balance.dart';
import '../models/get_faq_model.dart';
import '../models/get_plan_model.dart';
import '../models/get_profile.dart';
import '../models/get_state_model.dart';
import '../models/login_model.dart';
import '../models/mobile_verify_model.dart';
import '../models/my_post_model.dart';
import '../models/my_transaction_model.dart';
import '../models/profile_contant_model.dart';
import '../routs/app_routs.dart';
import '../routs/arguments.dart';
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
        print(responseData.id);
        Preferances.setString("userId", responseData.id);
        Preferances.setString("Token", responseData.token);
        Preferances.setString("profileStatus", responseData.branchKycStatus);
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
      response = await dio.post(EndPoints.updateProfile,data: data);
      print("update 1");
      if (response.statusCode == 200) {
        print("update if");
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'update Successfully...',
          backgroundColor: Colors.grey,
        );


        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        print("update else");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------Delete post API-----------------------//
  Future deletePost(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      //Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.deletePost,data: data);
      print("update 1");
      if (response.statusCode == 200) {
        print("delete if");
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'Delete Successfully...',
          backgroundColor: Colors.grey,
        );


        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        print("update else");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }


  //----------------------------UPDATE COMMENT API-----------------------//
  Future updateComment(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
     Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.updateComment,data: data);
      print("update 1");
      if (response.statusCode == 200) {
        print("update if");
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'Comment Added',
          backgroundColor: Colors.grey,
        );
        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        print("update else");
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
      throw e.error;
    }
  }

  //----------------------------UPDATE COMMENT API-----------------------//
  Future updateLike(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      //Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.updateLike,data: data);
      print("update 1");
      if (response.statusCode == 200) {
        print("update if");
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'Liked',
          backgroundColor: Colors.grey,
        );
        debugPrint('responseData ----- > ${response.data}');
        return response.data;
      } else {
        print("update else");
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
      BuildContext context,int status,
      ) async {
    try {
      String? id = await Preferances.getString("userId");
      print("id here:---${id}");
      FormData data() {
        return FormData.fromMap({
          "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
        });
      }

      if(status == 0){
        Loader.showLoader();
      }
      Response response;
      response = await dio.post(EndPoints.getAllPost,data: data());
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

  //----------------------------ALL MY POST API-----------------------//

  Future<MyPostModel?> getMyPost(
      BuildContext context,int status,
      ) async {
    try {
      String? id = await Preferances.getString("userId");
      print("id here:---${id}");
      FormData data() {
        return FormData.fromMap({
          "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
        });
      }

      if(status == 0){
        Loader.showLoader();
      }
      Response response;
      response = await dio.post(EndPoints.getMyPost,data: data());
      print("1");
      MyPostModel responseData = MyPostModel.fromJson(response.data);
      if (responseData.status == 200 ) {
        print(" if here");
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

  //----------------------------  Company Profile API-----------------------//

  Future<GetProfile?> getCompanyProfile(
      BuildContext context,
      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getCompanyProfile);
      print("1");
      GetProfile responseData = GetProfile.fromJson(response.data);
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

  Future<GetCurrentBalanceModel?> getCurrentBalance(BuildContext context,) async {
    try {
      String? id = await Preferances.getString("userId");
      print("id here:---${id}");
      FormData data() {
        return FormData.fromMap({
          "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
        });
      }
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getCurrentBalance,data: data());
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


  //----------------------------PROFILE CONTANT API-----------------------//

  Future<ProfileContantModel?> profileContant(BuildContext context) async {
    try {
      String? id = await Preferances.getString("userId");
      print("id here:---${id}");
      FormData data() {
        return FormData.fromMap({
          "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
        });
      }
    Loader.showLoader();
    Response response;
    response = await dio.post(EndPoints.profileContant,data: data());
    print("1");
    print("responce:===${response.data}");

    if (response.statusCode == 200 ) {
      print("2");
      ProfileContantModel responseData = ProfileContantModel.fromJson(response.data);

    Loader.hideLoader();
    print("GET PROFILE DATA: ${responseData}");
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

  //-----------------------------STATE LIST API---------------------------//
  Future<GetStateListModel?> getStateList() async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(
        EndPoints.getState,
        options: Options(headers: {"Content-Type": 'application/json'}),
      );
      if (response.statusCode == 200) {
        GetStateListModel responseData =
        GetStateListModel.fromJson(response.data);
        Loader.hideLoader();
        return responseData;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    } finally {
      Loader.hideLoader();
    }
    return null;
  }

//-----------------------------CITY LIST API---------------------------//
  Future<GetCityModel?> getCityList(String stateId) async {
    try {
      Loader.showLoader();
      Response response;
      FormData formData = FormData.fromMap({"stateid": stateId});
      response = await dio.post(EndPoints.getCity,
          options: Options(headers: {"Content-Type": 'application/json'}),
          data: formData);
      if (response.statusCode == 200) {
        GetCityModel responseData =
        GetCityModel.fromJson(response.data);
        Loader.hideLoader();
        return responseData;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    } finally {
      Loader.hideLoader();
    }
    return null;
  }

  //----------------------------MY TRANSACTION API-----------------------//

  Future<MyTransactionModel?> myTransactionApi(
      BuildContext context,{
        FormData? data,

      }

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getCity);
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

  //----------------------------GET ALL COMMENT API-----------------------//

  Future<GetAllCommentModel?> getAllCommnet(
      BuildContext context,int status,{
        FormData? data,
      }
      ) async {
    try {
    if(status == 0){
      Loader.showLoader();
    }
      Response response;
      response = await dio.post(EndPoints.getAllComment,data: data);
      print("1");
      if (response.statusCode == 200 ) {
        GetAllCommentModel responseData = GetAllCommentModel.fromJson(response.data);

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

  Future<GetPlanModel?> getPlanApi(
      BuildContext context,int status,

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
      response = await dio.post(EndPoints.addPost,data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: 'Post upload Successfully...',
          backgroundColor: Colors.grey,
        );
        Navigator.pushNamed(context, Routs.mainHomeScreen,arguments: SendArguments(bottomIndex: 0));

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

  //----------------------------MOBILE VERIFY API-----------------------//
  Future<void> mobileVerifyApi(
      BuildContext context,String phoneNumber, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.verifyMobile,
          data: data);

      if (response.statusCode == 200) {
        Loader.hideLoader();
       MobileVerifyModel model = MobileVerifyModel.fromJson(response.data);

        print("my mobile data:=${response}");
        print("my mobile data status:=${response.data}");

        if(model.message == 1){
          CommonFunctions.toast("Mobile Number Is Already Register");
        }else{
          Navigator.pushNamed(context, Routs.otpVerificationScreen,
              arguments: SendArguments(
                  phoneNumber: phoneNumber,
                  otpStatus: 0
              ) );
        }
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

  //----------------------------GET ALL CATEGORY API-----------------------//

  Future<GetAllCategoryModel?> getAllCategory(

      BuildContext context,int status,

      ) async {
    try {
      String? id = await Preferances.getString("userId");

      if(status == 0){
        Loader.showLoader();
      }
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

  //----------------------------SUB PAYMENT API-----------------------//

  Future subscriptionPayment(
      BuildContext context, {
        FormData? data,
      }) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.subscriptionPayment,
          // options: Options(headers: {
          //   "Client-Service": "frontend-client",
                                  //   "Auth-Key": 'si m plerestapi',
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

  //----------------------------GET CATEGORY API-----------------------//

  Future<GetAllPostModel?> getAllPostByCategory(
      BuildContext context,
      {
        FormData? data,
      }

      ) async {
    try {
      Loader.showLoader();
      Response response;
      response = await dio.post(EndPoints.getAllPostByCategory,data: data);
      print("1");
      GetAllPostModel responseData = GetAllPostModel.fromJson(response.data);

      if (response.statusCode == 200 )  {
        print("2");
        Loader.hideLoader();


        // Navigator.pushNamed(context, Routs.categoryScreen, arguments: SendArguments(bottomIndex: 0));

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


  //----------------------------ALL POST API-----------------------//

  // Future<GetAllPostModel?> getAllPost(
  //     BuildContext context,int status,
  //     ) async {
  //   try {
  //     String? id = await Preferances.getString("userId");
  //     print("id here:---${id}");
  //     FormData data() {
  //       return FormData.fromMap({
  //         "loginid" : id!.replaceAll('"', '').replaceAll('"', '').toString(),
  //       });
  //     }
  //
  //     if(status == 0){
  //       Loader.showLoader();
  //     }
  //     Response response;
  //     response = await dio.post(EndPoints.getAllPost,data: data());
  //     print("1");
  //     GetAllPostModel responseData = GetAllPostModel.fromJson(response.data);
  //     if (responseData.status == 200 ) {
  //       print("2");
  //       Loader.hideLoader();
  //       return responseData;
  //     } else {
  //       print("3");
  //       Loader.hideLoader();
  //       throw Exception(response.data);
  //     }
  //   } on DioError catch (e) {
  //     Loader.hideLoader();
  //     print("4");
  //     debugPrint('Dio E  $e');
  //   } finally {
  //     print("5");
  //     Loader.hideLoader();
  //   }
  //   return null;
  // }



}

