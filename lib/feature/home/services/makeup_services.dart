import 'package:flutter_makeup/feature/home/model/makeup_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMakeupService {
  late INetworkManager networkManager;
  IMakeupService(this.networkManager);

  Future<List<MakeupModel>?> fetchMakeup();
}

class MakeupService extends IMakeupService {
  MakeupService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<MakeupModel>?> fetchMakeup() async {
    final response = await networkManager.send<MakeupModel, List<MakeupModel>>(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline",
        parseModel: MakeupModel(),
        method: RequestType.GET);
    return response.data;
  }
}
