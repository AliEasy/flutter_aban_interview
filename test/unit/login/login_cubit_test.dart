import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';
import 'package:flutter_aban_interview/features/login/domain/use_case/login_use_case.dart';
import 'package:flutter_aban_interview/features/login/presentation/manager/login/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late LoginCubit loginCubit;
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(mockLoginUseCase);
  });

  tearDown(() => loginCubit.close());

  final loginRequest = LoginRequestEntity(email: 'test@gmail.com', password: '123456');

  group('test LoginCubit', () {
    blocTest<LoginCubit, LoginState>(
      'test login success',
      build: () {
        when(() => mockLoginUseCase.call(loginRequest)).thenAnswer((_) async => Result.success(data: null));
        return loginCubit;
      },
      act: (cubit) => cubit.login(loginRequest),
      expect: () => [
        const LoginState.loading(),
        const LoginState.success(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'test login fail',
      build: () {
        when(() => mockLoginUseCase.call(loginRequest)).thenAnswer((_) async => Result.failure(message: 'Login failed'));
        return loginCubit;
      },
      act: (cubit) => cubit.login(loginRequest),
      expect: () => [
        const LoginState.loading(),
        const LoginState.failure(message: 'Login failed'),
      ],
    );
  });
}
