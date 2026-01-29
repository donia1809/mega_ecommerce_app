abstract class ApiHelper {
  Future<dynamic> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> postRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isFormData = false,
  });

  Future<dynamic> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<dynamic> putRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<dynamic> patchRequest({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
