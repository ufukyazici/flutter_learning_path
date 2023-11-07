import 'package:flutter_application_1/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_application_1/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;
  final String _loginPath = "/login";

  ILoginService(this.networkManager);
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model);
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        data: model, parseModel: TokenModel(), method: RequestType.POST);
  }
}

class LoginService2 extends ILoginService {
  LoginService2(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        data: model, parseModel: TokenModel(), method: RequestType.GET);
  }
}
