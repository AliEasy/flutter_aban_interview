import 'package:flutter_aban_interview/features/home/data/model/cryptocurrency_response_model.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';

extension OnCryptocurrencyResponseModel on CryptocurrencyResponseModel {
  CryptocurrencyResponseEntity mapper() {
    return CryptocurrencyResponseEntity(
      id: id,
      createdAt: createdAt,
      name: name,
      price: price,
      symbol: symbol,
      iconAddress: iconAddress,
      isFavorite: isFavorite,
    );
  }
}
