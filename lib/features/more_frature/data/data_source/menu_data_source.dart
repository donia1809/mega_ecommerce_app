import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/more_frature/data/model/menu_model.dart';

abstract class MenuDataSource {
  Future<MenuModel> getTermsAndConditions();
  Future<MenuModel> getPrivacyPolicy();
  Future<MenuModel> getAboutApp();

}

class MenuDataSourceImpl implements MenuDataSource {
  final ApiHelper apiHelper;

  MenuDataSourceImpl({required this.apiHelper});
  @override
  Future<MenuModel> getTermsAndConditions() async {
    final response = await apiHelper.getRequest(endPoint: '/api/info/terms');
    return MenuModel.fromJson(response);
  }

  @override
  Future<MenuModel> getPrivacyPolicy() async {
    final response = await apiHelper.getRequest(endPoint: '/api/info/privacy');
    return MenuModel.fromJson(response);
  }
  
  @override
  Future<MenuModel> getAboutApp() async{
    final response = await apiHelper.getRequest(endPoint: '/api/info/about');
    return MenuModel.fromJson(response);
  }
}
