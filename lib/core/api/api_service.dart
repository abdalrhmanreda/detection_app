// import 'package:dio/dio.dart';
// import 'package:easy_parking_system/core/api/api_constant.dart';
// import 'package:easy_parking_system/features/register/data/models/sign_up_body_request.dart';
// import 'package:easy_parking_system/features/register/data/models/sign_up_respone_model.dart';
// import 'package:retrofit/http.dart';
//
// part 'api_service.g.dart';
//
// @RestApi(baseUrl: ApiConstant.baseUrl)
// abstract class ApiService {
//   factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
//   // @POST(ApiConstant.logic)
//   //
//   // /// I have used the Map<String, dynamic> as the body because the logic api is taking the email and password as the body
//   // /// but I will instead use the logic model to pass the email and password
//   // Future<ApiResult> logic(
//   //     @Body() Map<String, dynamic> body); // this is the logic api
//   @POST(ApiConstant.signup)
//   Future<SignUpResponeBodyModel> register(
//       @Body() SignUpBodyRequest body); // this is the register api
// }
