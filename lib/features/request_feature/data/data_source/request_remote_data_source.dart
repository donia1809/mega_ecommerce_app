import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/request_feature/data/model/request_model.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/use_cases/send_request_use_case.dart';

abstract class RequestRemoteDataSource {
  Future<RequestModel> sendRequest(RequestParams params);
}

class RequestRemoteDataSourceImplement implements RequestRemoteDataSource {
  final ApiHelper apiHelper;

  RequestRemoteDataSourceImplement({required this.apiHelper});
  @override
  Future<RequestModel> sendRequest(RequestParams params) async {
    final response = await apiHelper.postRequest(
      endPoint: '/api/requests',
      body: params.toMap,
    );
    return RequestModel.fromJson(response);
  }
}
