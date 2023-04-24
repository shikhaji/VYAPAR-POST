import 'dart:core';

class EndPoints {
  static const String baseUrl = "https://khojloindia.in/android";
  static const String signUp = '$baseUrl/user_registration_login';
  static const String login = '$baseUrl/user_login';
  static const String updateProfile = '$baseUrl/update_kyc_detail';
  static const String forgetPassword = '$baseUrl/update_new_password';
  static const String getAllPost = '$baseUrl/get_all_post';
  static const String getMyPost = '$baseUrl/my_uploaded_post';
  static const String deletePost = '$baseUrl/delete_my_uploaded_post';
  static const String getCurrentBalance = '$baseUrl/get_current_balance';
  static const String getAllCategory = '$baseUrl/get_all_category';
  static const String profileContant = '$baseUrl/profile_content';
  static const String addWallet = '$baseUrl/add_wallet';
  static const String getFaq = '$baseUrl/get_faq';
  static const String getState = '$baseUrl/get_states';
  static const String getCity = '$baseUrl/get_district';
  static const String myTransaction = '$baseUrl/my_transaction';
  static const String getPlan = '$baseUrl/get_plans';
  static const String addPost = '$baseUrl/add_post';
  static const String verifyMobile = '$baseUrl/verify_mobile';
  static const String getCompanyProfile = '$baseUrl/get_profile';
  static const String getAllComment = '$baseUrl/get_all_comment_by_post_id';
  static const String updateComment = '$baseUrl/update_post_comment';
  static const String updateLike = '$baseUrl/update_like';
  static const String subscriptionPayment = '$baseUrl/update_payment_details';
  static const String getAllPostByCategory= '$baseUrl/get_all_post_by_category';
}
