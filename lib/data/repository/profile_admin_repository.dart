import 'dart:convert';
import 'dart:developer';
import 'package:canarytemplate/data/model/request/admin/admin_profile_request.dart';
import 'package:canarytemplate/data/model/response/admin_profile_response_model.dart';
import 'package:canarytemplate/service/service_http_client.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileAdminRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  ProfileAdminRepository(this._serviceHttpClient);

  Future<Either<String, AdminProfileResponseModel>> addProfile(
    Adminprofilerequest requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'admin/profile',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        final profileResponse = AdminProfileResponseModel.fromMap(jsonResponse);
        log("Add Admin Profile successful: ${profileResponse.message}");
        return right(profileResponse);
      } else {
        log("Add Admin Profile failed: ${jsonResponse['message']}");
        return left(jsonResponse['message'] ?? "Create Profile failed");
      }
    } catch (e) {
      log("Error in adding profile: $e");
      return left("An error occured while adding profile: $e");
    }
  }
}
