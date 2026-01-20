import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/auth_feature/data/model/auth_model.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/forget_password_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/login_use_case.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/signup_use_cases.dart';
import 'package:mega_ecommerce_app/features/auth_feature/domain/use_case/verify_account_use_case.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(LoginParams params);
  Future<AuthModel> signUp(SignupParams params);
  Future<void> verifyAccount(VerifyAccountParams params);
  Future<void> forgetPassword(ForgetPasswordParams params);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHelper apiHelper;

  AuthRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<AuthModel> login(LoginParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/auth/login',
      body: params.toMap,
    );
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> signUp(SignupParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/auth/signup',
      body: params.toMap,
    );

    return AuthModel.fromJson(response);
  }

  @override
  Future<void> verifyAccount(VerifyAccountParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/auth/verify-email',
      body: params.toMap,
    );
    return response;
  }
  
  @override
  Future<void> forgetPassword(ForgetPasswordParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/auth/forgot-password',
      body: params.toMap,
    );
    return response;
  }

  @override
  Future<void> logout() async {
    await apiHelper.getRequest(
      endPoint: '/api/auth/logout',
    );
  }
}
