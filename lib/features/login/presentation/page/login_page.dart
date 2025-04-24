import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/features/home/presentation/page/home_page.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';
import 'package:flutter_aban_interview/features/login/presentation/manager/form_validator/login_form_validator_cubit.dart';
import 'package:flutter_aban_interview/features/login/presentation/manager/login/login_cubit.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginFormValidatorCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            failure: (message, statusCode) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(message ?? S.current.unknown_error)),
                );
            },
          );
        },
        child: Builder(builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: S.current.email,
                                hintText: S.current.email,
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return context
                                    .read<LoginFormValidatorCubit>()
                                    .validateEmail(value ?? '');
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: S.current.password,
                                hintText: S.current.password,
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                _onLoginTap(context);
                              },
                              validator: (value) {
                                return context
                                    .read<LoginFormValidatorCubit>()
                                    .validatePassword(value ?? '');
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            BlocBuilder<LoginFormValidatorCubit,
                                LoginFormValidatorState>(
                              builder: (context, state) {
                                return state.whenOrNull(
                                      valid: () {
                                        return BlocBuilder<LoginCubit, LoginState>(
                                          builder: (context, state) {
                                            return state.whenOrNull(
                                                  loading: () {
                                                    return const ElevatedButton(
                                                      onPressed: null,
                                                      child: SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child:
                                                              CircularProgressIndicator()),
                                                    );
                                                  },
                                                ) ??
                                                ElevatedButton(
                                                  onPressed: () {
                                                    _onLoginTap(context);
                                                  },
                                                  child: Text(S.current.login),
                                                );
                                          },
                                        );
                                      },
                                    ) ??
                                    ElevatedButton(
                                      onPressed: null,
                                      child: Text(S.current.login),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  _onLoginTap(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<LoginCubit>().login(LoginRequestEntity(
          email: _emailController.text,
          password: _passwordController.text,
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
