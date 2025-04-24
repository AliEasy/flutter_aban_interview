import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/common/extensions/double_extension.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';
import 'package:flutter_svg/svg.dart';

class CryptocurrencyItemWidget extends StatelessWidget {
  final CryptocurrencyResponseEntity item;

  const CryptocurrencyItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (item.iconAddress.isNotEmpty)
            SvgPicture.network(
              item.iconAddress,
              width: 40,
              height: 40,
              placeholderBuilder: (context) =>
                  const Icon(Icons.question_mark_rounded),
            )
          else
            const Icon(
              Icons.question_mark_rounded,
              size: 40,
            ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: item.symbol,
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: ' | ${item.name}'),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(item.price.formatPrice(context))
        ],
      ),
    );
  }
}
