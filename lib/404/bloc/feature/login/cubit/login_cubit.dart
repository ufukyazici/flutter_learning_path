import 'package:flutter_application_1/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_application_1/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_application_1/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginService) : super(const LoginState());
  final ILoginService loginService;

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(isLoading: true, model: LoginModel(email, password)));
    final response = await loginService.login(LoginModel(email, password));
    if (response.data?.token != null) {
      emit(state.copyWith(isLoading: false, tokenModel: response.data, isCompleted: true));
    } else {
      emit(state.copyWith(isLoading: false, isCompleted: false));
    }
  }
}
