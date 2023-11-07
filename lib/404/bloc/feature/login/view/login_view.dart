import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/image_learn.dart';
import 'package:flutter_application_1/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_application_1/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_application_1/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_application_1/product/service/vexana_network_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class LoginViewAdvance extends StatefulWidget {
  const LoginViewAdvance({super.key});

  @override
  State<LoginViewAdvance> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginViewAdvance> {
  final String _loginText = "Login";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading ? CircularProgressIndicator(color: context.general.randomColor) : const SizedBox();
            },
          ),
          centerTitle: true,
        ),
        body: Form(
            key: _formLoginKey,
            child: Padding(
              padding: const PagePadding.all(),
              child: BlocSelector<LoginCubit, LoginState, bool>(
                selector: (state) {
                  return state.isLoading;
                },
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: state,
                    child: AnimatedOpacity(
                      duration: context.duration.durationLow,
                      opacity: state ? 0.3 : 1,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (String? value) => value.ext.isValidEmail ? null : "Email is not valid",
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextFormField(
                            obscureText: _isVisible,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: "Password",
                                labelText: "Password",
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: _changeVisibility,
                                    icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility))),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return BlocListener<LoginCubit, LoginState>(
                                    listener: (context, state) {
                                      if (state.isCompleted) {
                                        context.route.navigateToPage(ImageLearn(
                                          token: state.tokenModel?.token ?? "",
                                        ));
                                      }
                                    },
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formLoginKey.currentState?.validate() ?? false) {
                                            context
                                                .read<LoginCubit>()
                                                .checkUser(_emailController.text, _passwordController.text);
                                          }
                                        },
                                        child: Text("$_loginText - ${state.model?.email ?? ''}")),
                                  );
                                },
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
}
