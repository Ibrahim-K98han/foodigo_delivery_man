import 'package:http/http.dart' as http;

import '../../../data/network_parser.dart';
import '../../../data/remote_url.dart';
import '../model/register_state_model.dart';

abstract class RegisterRemoteDataSource {
  Future registerStepOne(RegisterStateModel body);
  Future registerStepTwo(RegisterStateModel body, Uri url);
  Future registerStepThree(RegisterStateModel body, Uri url);
  Future getCity();

  Future otpVerify(RegisterStateModel body, String email);

  Future<String> resendVerificationCode(Map<String, dynamic> body);
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceImpl({required this.client});

  authHeader(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    // 'Accept': "x-www-form-urlencoded/application"
  };

  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  final postDeleteHeader = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  @override
  Future registerStepOne(RegisterStateModel body) async {
    final uri = Uri.parse(RemoteUrls.registerStepOne);
    print("register step one : $uri");
    final clientMethod = client.post(
      uri,
      body: body.toMap(),
      headers: postDeleteHeader,
    );
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future registerStepTwo(RegisterStateModel body, Uri url) async {
    final request = http.MultipartRequest('POST', url);
    request.fields.addAll(body.toMap());
    request.headers.addAll(postDeleteHeader);
    if (body.profileImg.isNotEmpty) {
      final file = await http.MultipartFile.fromPath(
        'profile_image',
        body.profileImg,
      );
      request.files.add(file);
    }
    if (body.document.isNotEmpty) {
      final file = await http.MultipartFile.fromPath('document', body.document);
      request.files.add(file);
    }
    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future registerStepThree(RegisterStateModel body, Uri url) async {
    final request = http.MultipartRequest('POST', url);
    request.fields.addAll(body.toMap());
    request.headers.addAll(postDeleteHeader);
    if (body.vehicleImage.isNotEmpty) {
      final file = await http.MultipartFile.fromPath(
        'vehicle_image',
        body.vehicleImage,
      );
      request.files.add(file);
    }
    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getCity() async {
    final uri = Uri.parse(RemoteUrls.getCity);
    print('City====$uri');
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future otpVerify(RegisterStateModel body, String email) async {
    final uri = Uri.parse(RemoteUrls.otpVerify);
    print("Otp url : $uri");
    final clientMethod = client.post(
      uri,
      body: body.toMap(),
      headers: postDeleteHeader,
    );
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future<String> resendVerificationCode(Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.resendVerificationCode);

    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: body,
    );
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody['message'] as String;
  }

  @override
  Future<String> forgotPassword(Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.forgotPassword);
    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: body,
    );
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody['message'] as String;
  }
}
