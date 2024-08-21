
class HttpClient {
  static final HttpClient _instance = HttpClient._internal();

  // Private constructor
  HttpClient._internal();

  factory HttpClient() => _instance;

}