import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/user_featere/data/model/update_profile_model.dart';
import 'package:mega_ecommerce_app/features/user_featere/data/model/user_profile_model.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_email_ue_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_password_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/verify_email_update_use_case.dart';

abstract class UserProfileDataSource {
  Future<UserProfileModel> getProfile();
  Future<UserProfileModel> updateProfile(UpdateProfileParams params);
  Future<UpdateProfileModel> updateEmail(UpdateEmailParams params);
  Future<UpdateProfileModel> resendEmailUpdateCode();
  Future<UpdateProfileModel> veriftEmailUpdate(VerifyEmailUpdateParams params);
  Future<UpdateProfileModel> updatePassword(UpdatePasswordParams params);
}

class UserProfileDataSourceImpl implements UserProfileDataSource {
  final ApiHelper apiHelper;

  UserProfileDataSourceImpl({required this.apiHelper});

  @override
  Future<UserProfileModel> getProfile() async {
    final response = await apiHelper.getRequest(endPoint: '/api/users/profile');
    return UserProfileModel.fromJson(response);
  }

  @override
  Future<UserProfileModel> updateProfile(UpdateProfileParams params) async {
    final response = await apiHelper.putRequest(
      endPoint: '/api/users/profile',
      body: params.toMap,
    );
    return UserProfileModel.fromJson(response);
  }

  @override
  Future<UpdateProfileModel> updateEmail(UpdateEmailParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/users/update-email',
      body: params.toMap,
    );
    return UpdateProfileModel.fromJson(response);
  }

  @override
  Future<UpdateProfileModel> veriftEmailUpdate(VerifyEmailUpdateParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/users/verify-email-update',
      body: params.toMap
    );
    return UpdateProfileModel.fromJson(response);
  }

  @override
  Future<UpdateProfileModel> updatePassword(UpdatePasswordParams params) async {
    final response = await apiHelper.putRequest(
      endPoint: '/api/users/update-password',
      body: params.toMap,
    );
    return UpdateProfileModel.fromJson(response);
  }
  
  @override
  Future<UpdateProfileModel> resendEmailUpdateCode() async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/users/update-email/resend',
    );
    return UpdateProfileModel.fromJson(response);
  }
}
