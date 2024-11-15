import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../common/network/network_service.dart';

class AlertRepository {
  AlertRepository({
    required this.client,
  }) : super();

  final http.Client client;

  // Endpoint /upload to send the imag e to the server and get the URL
  Future<String> uploadImage(File file) async {
    try {
      var response = await httpService.postMultipart(
        endpoint: '/upload',
        client: client,
        body: {
          'file': file,
        },
      );

      if (response.success == true) {
        return response.body!;
      } else {
        throw Exception('Failed to upload image: ${response.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteImage(String filePath) async {
    try {
      var response = await httpService
          .delete(endpoint: '/upload', client: client, queryParams: {
        'file': filePath,
      });

      if (response.success == true) {
        return true;
      } else {
        throw Exception('Failed to delete image: ${response.message}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

final alertRepository = Provider<AlertRepository>(
  (ref) => AlertRepository(client: http.Client()),
);
