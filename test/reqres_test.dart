import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_application_1/303/testable/user_save_model.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([ReqresProvider, ResourceContext])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{"vb": "veli"};
    SharedPreferences.setMockInitialValues(values);
  });
  test('saveToLocale - Test', () {
    var mockProvider = ReqresProvider(ResourceService(dio: Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);
    expect(result, false);
  });

  test('userTest - Test', () async {
    var userViewModel = UserSaveViewModel();
    final result = userViewModel.getData("vb", MockStore());
    expect(result, false);
  });
}
