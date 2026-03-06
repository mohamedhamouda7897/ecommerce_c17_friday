class BaseExceptions implements Exception {
  int? code;
  String? message;

  BaseExceptions({this.message, this.code});
}


class GeneralException extends BaseExceptions {
  GeneralException([String? message]) : super(message: message, code: 99);
}
class AuthFailedException extends BaseExceptions {
  AuthFailedException([String? message]) : super(message: message, code: 99);
}

class BadRequestException extends BaseExceptions {
  BadRequestException([String? message]) : super(message: message, code: 400);
}

class NotFoundException extends BaseExceptions {
  NotFoundException([String? message]) : super(message: message, code: 404);
}

class ConflictException extends BaseExceptions {
  ConflictException([String? message]) : super(message: message, code: 409);
}

class InternalServerErrorException extends BaseExceptions {
  InternalServerErrorException([String? message])
    : super(message: message, code: 500);
}
