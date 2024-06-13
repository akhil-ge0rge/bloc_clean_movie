class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() => '$_prefix $_message';
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(message, "You dont have acess to this");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, "Request Time Out");
}

class FetchingDataException extends AppExceptions {
  FetchingDataException([String? message])
      : super(message, 'Error While Fetching Data');
}
