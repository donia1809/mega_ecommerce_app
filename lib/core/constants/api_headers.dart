Map<String, String> defaultHeaders() => {
  "Accept-Language": "ar",
  "Accept": "application/json",
};

Map<String, String> authHeaders(String token) => {
  ...defaultHeaders(),
  "Authorization": "Bearer $token",
};

