import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/cryptocurrency_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cryptocurrency_list_state.dart';

part 'cryptocurrency_list_cubit.freezed.dart';

@injectable
class CryptocurrencyListCubit extends Cubit<CryptocurrencyListState> {
  final CryptocurrencyUseCase _cryptocurrencyUseCase;

  CryptocurrencyListCubit(this._cryptocurrencyUseCase)
      : super(const CryptocurrencyListState.initial()) {
    getList();
  }

  getList() async {
    emit(const CryptocurrencyListState.loading());
    final result = await _cryptocurrencyUseCase.call();
    result.whenOrNull(
      success: (data) {
        emit(CryptocurrencyListState.success(list: data ?? []));
      },
      failure: (message, statusCode) {
        emit(CryptocurrencyListState.failure(
            message: message, statusCode: statusCode));
      },
    );
  }
}
