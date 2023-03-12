import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  @override
  List<Object?> get props => [
        statusCode,
        statusCode,
        statusMessage,
      ];

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
      );
}
