import 'package:foodigo_delivery_man/data/network_parser.dart';
import 'package:foodigo_delivery_man/data/remote_url.dart';
import 'package:http/http.dart' as http;

abstract class CityDocumentVehicleRemoteDataSource {
  Future getCityDocumentVehicleData();
}

class CityDocumentVehicleRemoteDataSourceImpl
    implements CityDocumentVehicleRemoteDataSource {
  final http.Client client;

  CityDocumentVehicleRemoteDataSourceImpl({required this.client});

  authHeader() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Accept': "x-www-form-urlencoded/application"
  };

  @override
  Future getCityDocumentVehicleData() async {
    final uri = Uri.parse(RemoteUrls.cityDocumentVehicle);
    print('CityDocumentVehicle====$uri');
    final clientMethod = client.get(uri, headers: authHeader());
    final responseJsonBody = await NetworkParser.callClientWithCatchException(
      () => clientMethod,
    );
    return responseJsonBody;
  }
}
