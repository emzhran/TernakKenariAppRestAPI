import 'dart:convert';

import 'package:canarytemplate/data/model/request/admin/anak_request_model.dart';
import 'package:canarytemplate/data/model/response/get_all_anak_response.dart';
import 'package:canarytemplate/service/service_http_client.dart';
import 'package:dartz/dartz.dart';

class AnakRepository {
  final ServiceHttpClient _serviceHttpClient;

  AnakRepository(this._serviceHttpClient);

  Future<Either<String, GetAnakById>> addAnak(
    Anakrequestmodel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        "admin/anak",
        requestModel.toMap(),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = GetAnakById.fromJson(jsonResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occured');
      }
    } catch (e) {
      return Left("An error occurred while adding anak: $e");
    }
  }
}
