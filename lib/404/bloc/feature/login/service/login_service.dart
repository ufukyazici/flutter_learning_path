import 'package:flutter_application_1/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_application_1/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

class LoginService {
  final INetworkManager networkManager;

  LoginService(this.networkManager);

  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>("/login",
        data: model, parseModel: TokenModel(), method: RequestType.POST);
  }
}
