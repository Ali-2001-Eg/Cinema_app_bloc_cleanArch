import 'package:payment_app/core/networks/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException(this.errorMessageModel);
}

class LocalDataBaseException implements Exception{
  final String message;

  const LocalDataBaseException(this.message);
}