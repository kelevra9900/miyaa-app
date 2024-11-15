import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'models/exceptions.dart';
import 'models/http_service_reponse.dart';
import '../secure_storage.dart';
import '../../tools/constants.dart';

class HttpService {
  String url = constants.domain;
  String timeoutMessage =
      'We couldn\'t connect to our servers. Try again in a moment.';

  Future<String?> token() async {
    return await secureStorage.jwt;
  }

  Future<String?> refreshToken() async {
    return await secureStorage.refreshToken;
  }

  Future<void> attemptTokenRefresh() async {
    String? currentRefreshToken = await refreshToken();
    if (currentRefreshToken != null && currentRefreshToken.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('$url/auth/refresh-token'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'refreshToken': currentRefreshToken}),
        );

        log('[http-service] [attemptTokenRefresh]'
            '\nresponse: ${response.body}');

        if (response.statusCode == 201) {
          await secureStorage.setJwt(response.body);
        } else {
          await secureStorage.flushData();
          throw AuthException('Refresh token failed');
        }
      } catch (e) {
        await secureStorage.flushData();
        rethrow;
      }
    } else {
      await secureStorage.flushData();
      throw AuthException('No refresh token available');
    }
  }

  Future<HttpServiceResponse> get({
    required String endpoint,
    http.Client? client,
    Map<String, String>? queryParams,
    bool needAuth = true,
  }) async {
    return await _handleRequest(() async {
      http.Client? httpClient = client ?? http.Client();

      Uri uri = Uri.parse("$url$endpoint");
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      Response response = await httpClient.get(uri, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        if (needAuth && await token() != null)
          HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      });

      return await validateResponse(response);
    });
  }

  Future<HttpServiceResponse> post({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    return await _handleRequest(
      () => _post(
        endpoint: endpoint,
        body: body,
        needAuth: needAuth,
        client: client,
      ),
    );
  }

  Future<HttpServiceResponse> _post({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    http.Client? httpClient = client ?? http.Client();
    log('[http-service] [post]'
        '\nbody: ${json.encode(body)}');
    Response response = await httpClient
        .post(Uri.parse("$url$endpoint"), body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      if (needAuth) "Authorization": "Bearer ${await token()}",
    });
    return await validateResponse(response);
  }

  // Put
  Future<HttpServiceResponse> _put({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    return await _handleRequest(() async {
      http.Client? httpClient = client ?? http.Client();
      log('[http-service] [put]'
          '\nbody: ${json.encode(body)}');

      Response response = await httpClient.put(
        Uri.parse("$url$endpoint"),
        body: json.encode(body),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          if (needAuth) "Authorization": "Bearer ${await token()}",
        },
      );

      return await validateResponse(response);
    });
  }

  // Manejador para tratar la respuesta de error 401
  Future<HttpServiceResponse> _handleRequest(
      Future<HttpServiceResponse> Function() requestFn) async {
    log('====== [http-service] [_handleRequest] ======');

    try {
      return await requestFn();
    } catch (e) {
      if (e is HttpServiceResponse && e.errorCode == 401) {
        await attemptTokenRefresh();
        return await requestFn();
      }
      rethrow;
    }
  }

  Future<HttpServiceResponse> put({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    return await _put(
      endpoint: endpoint,
      body: body,
      needAuth: needAuth,
      client: client,
    );
  }

  Future<HttpServiceResponse> delete({
    required String endpoint,
    http.Client? client,
    Map<String, String>? queryParams,
    bool needAuth = true,
  }) async {
    http.Client? httpClient = client ?? http.Client();

    try {
      Uri uri = Uri.parse("$url$endpoint");
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }
      Response response = await httpClient.delete(uri, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        if (needAuth && await token() != null)
          HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      });

      return validateResponse(response);
    } on SocketException catch (_) {
      return HttpServiceResponse(
          success: false,
          message:
              "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo.");
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: "$e",
        message:
            "En este momento nuestro servicio está experimentando una falla técnica. Por favor vuelve a intentarlo.",
      );
    }
  }

  Future<HttpServiceResponse> patch({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    http.Client? httpClient = client ?? http.Client();
    log('[http-service] [patch]'
        '\nbody: ${json.encode(body)}');
    try {
      Response response = await httpClient
          .patch(Uri.parse("$url$endpoint"), body: json.encode(body), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        if (needAuth)
          if (await token() != "") "Authorization": "Bearer ${await token()}",
      });

      return await validateResponse(response);
    } on SocketException catch (_) {
      return HttpServiceResponse(
          success: false,
          message:
              "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo.");
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: "$e",
        message:
            "En este momento nuestro servicio está experimentando una falla técnica. Por favor vuelve a intentarlo.",
      );
    }
  }

  Future<HttpServiceResponse> postMultipart({
    required String endpoint,
    required Map<String, dynamic> body,
    bool needAuth = true,
    http.Client? client,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse("$url$endpoint"));

      log('[http-service] [postMultipart]'
          '\nendpoint: $endpoint'
          '\nbody: $body');

      if (needAuth) {
        if (await token() != "") {
          request.headers['Authorization'] = "Bearer ${await token()}";
        }
      }
      body.forEach((key, value) async {
        if (value is File) {
          request.files.add(http.MultipartFile.fromBytes(
            key,
            await value.readAsBytes(),
            filename: value.path.split('/').last,
          ));
        } else if (value is http.MultipartFile) {
          request.files.add(value);
        } else {
          request.fields[key] = value.toString();
        }
      });
      // Log headers
      var response = await request.send();

      log('======= RESPONSE REASON PHRASE: ${response.reasonPhrase} =======');
      log('======= RESPONSE REQUEST: ${response.request} =======');

      // Convierte la respuesta en un String
      var responseString = await response.stream.bytesToString();

      return HttpServiceResponse(
        success: response.statusCode == 200 || response.statusCode == 201,
        body: responseString,
        message: responseString,
      );
    } on SocketException catch (e) {
      log('Error: SocketException catch $e');
      return HttpServiceResponse(
        success: false,
        message:
            "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo.",
      );
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: "$e",
        message:
            "En este momento nuestro servicio está experimentando una falla técnica. Por favor vuelve a intentarlo.",
      );
    }
  }

  Future<HttpServiceResponse> validateResponse(Response response) async {
    bool success = false;
    String message = "";
    String res = response.body;
    log('[http-service] [validateResponse]');
    log(res);
    log('\n StatusCode: ${response.statusCode}');
    log('\nURL: ${response.request}');
    // Body
    log('\nBody: ${response.body}');

    if (response.body.isNotEmpty &&
        json.decode(response.body).runtimeType != List) {
      Map<String, dynamic> body = json.decode(response.body);
      message = body["message"] ?? "";

      if (body.containsKey('errors')) {
        List<dynamic> errors = body['errors'];
        List<dynamic> errorMessages =
            errors.map((error) => error['message']).toList();
        String errorMessage = errorMessages.join(', ');
        message = errorMessage;
        errors.isEmpty ? message = body["message"] : null;
      }
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        success = true;
        break;
      case 401:
        success = false;
        log('========= 401 UNAUTHORIZED =========');
        throw HttpServiceResponse(
            success: false, errorCode: 401, message: message);
      default:
        return HttpServiceResponse(
            success: false, errorCode: response.statusCode, message: message);
    }

    return HttpServiceResponse(
        success: success, message: response.body, body: response.body);
  }
}

final HttpService httpService = HttpService();
