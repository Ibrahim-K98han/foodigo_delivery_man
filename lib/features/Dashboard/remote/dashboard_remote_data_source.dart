import 'package:foodigo/data/network_parser.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:http/http.dart' as http;

abstract class DashboardRemoteDataSource {
  Future getResDashboard(String token);
  Future getSplash();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final http.Client client;

  DashboardRemoteDataSourceImpl({required this.client});

  authHeader(String token) => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    // 'Accept': "x-www-form-urlencoded/application"
  };
  header() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Accept': "x-www-form-urlencoded/application"
  };

  @override
  Future getResDashboard(String token) async {
    final uri = Uri.parse(RemoteUrls.dashboard);
    print('Dashboard====$uri');
    final clientMethod = client.get(uri, headers: authHeader(token));
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }

  @override
  Future getSplash() async {
    final uri = Uri.parse(RemoteUrls.splash);
    print('Splash====$uri');
    final clientMethod = client.get(uri, headers: header());
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }
}
