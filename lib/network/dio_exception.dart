import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:assignment/model/error/error.dart';

part 'dio_exception.freezed.dart';

@freezed
abstract class DioExceptions with _$DioExceptions {
  const factory DioExceptions.requestCancelled() = RequestCancelled;

  const factory DioExceptions.unauthorizedRequest(String reason) = UnauthorizedRequest;

  const factory DioExceptions.badRequest() = BadRequest;

  const factory DioExceptions.notFound(String reason) = NotFound;

  const factory DioExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory DioExceptions.notAcceptable() = NotAcceptable;

  const factory DioExceptions.requestTimeout() = RequestTimeout;

  const factory DioExceptions.sendTimeout() = SendTimeout;

  const factory DioExceptions.conflict() = Conflict;

  const factory DioExceptions.internalServerError() = InternalServerError;

  const factory DioExceptions.notImplemented() = NotImplemented;

  const factory DioExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory DioExceptions.noInternetConnection() = NoInternetConnection;

  const factory DioExceptions.formatException() = FormatException;

  const factory DioExceptions.unableToProcess() = UnableToProcess;

  const factory DioExceptions.defaultError(String error) = DefaultError;

  const factory DioExceptions.unexpectedError() = UnexpectedError;

  static DioExceptions handleResponse(Response? response) {
    ErrorModel? errorModel;

    try {
      errorModel = ErrorModel.fromJson(response?.data);
    } catch (e) {}

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return DioExceptions.unauthorizedRequest(errorModel?.statusMessage??"Not found");
        break;
      case 404:
        return DioExceptions.notFound(errorModel?.statusMessage??"Not found");
        break;
      case 409:
        return DioExceptions.conflict();
        break;
      case 408:
        return DioExceptions.requestTimeout();
        break;
      case 500:
        return DioExceptions.internalServerError();
        break;
      case 503:
        return DioExceptions.serviceUnavailable();
        break;
      default:
        var responseCode = statusCode;
        return DioExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static DioExceptions getDioException(error) {
    if (error is Exception) {
      try {
        DioExceptions dioExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              dioExceptions = DioExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              dioExceptions = DioExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              dioExceptions = DioExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              dioExceptions = DioExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              dioExceptions = DioExceptions.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              dioExceptions = DioExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          dioExceptions = DioExceptions.noInternetConnection();
        } else {
          dioExceptions = DioExceptions.unexpectedError();
        }
        return dioExceptions;
      } on FormatException catch (e) {
        return DioExceptions.formatException();
      } catch (_) {
        return DioExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        debugPrint(error.toString());
        return DioExceptions.unableToProcess();
      } else {
        return DioExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(DioExceptions dioExceptions) {
    var errorMessage = "";
    dioExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorizedRequest: (String error) {
      errorMessage = error;
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}