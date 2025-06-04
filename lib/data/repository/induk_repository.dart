import 'dart:convert';
import 'package:canarytemplate/data/model/request/admin/induk_request_model.dart';
import 'package:canarytemplate/data/model/response/get_all_induk_response.dart';
import 'package:canarytemplate/service/service_http_client.dart';
import 'package:dartz/dartz.dart';

class IndukRepository {
  final ServiceHttpClient _serviceHttpClient;

  IndukRepository(this._serviceHttpClient);

  Future<Either<String, GetIndukById>> addInduk(
    Indukrequestmodel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        "admin/induk",
        requestModel.toMap(),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileRespnose = GetIndukById.fromJson(jsonResponse);
        return Right(profileRespnose);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? "Unknown error occurred");
      }
    } catch (e) {
      return Left("An error occurred while adding induk: $e");
    }
  }

  Future<Either<String, GetAllIndukModel>> getAllInduk() async {
    try {
      final response = await _serviceHttpClient.get('admin/induk');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = GetAllIndukModel.fromJson(jsonResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left("An error occurred while getting induk: $e");
    }
  }
}
