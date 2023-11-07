import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'model_unknown.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager<EmptyModel>(options: BaseOptions(baseUrl: 'https://reqres.in/api'));
  });
  test('Vexana test', () async {
    final response = await networkManager.send<UnknownModel, UnknownModel>('/unknown',
        parseModel: UnknownModel(), method: RequestType.GET);
    print(response.data?.support?.text);
  });
}
