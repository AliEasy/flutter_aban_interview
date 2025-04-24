import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/features/home/presentation/manager/favorite/favorite_cryptocurrency_cubit.dart';
import 'package:flutter_aban_interview/features/home/presentation/manager/list/cryptocurrency_list_cubit.dart';
import 'package:flutter_aban_interview/features/home/presentation/widget/cryptocurrency_item_widget.dart';
import 'package:flutter_aban_interview/features/profile/presentation/page/profile_page.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CryptocurrencyListCubit>(),
      child: BlocListener<CryptocurrencyListCubit, CryptocurrencyListState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message, statusCode) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(message ?? S.current.unknown_error)),
                );
            },
          );
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(S.current.aban_interview),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
              body: BlocBuilder<CryptocurrencyListCubit, CryptocurrencyListState>(
                builder: (context, state) {
                  return state.whenOrNull(
                        loading: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                        success: (list) {
                          if (list.isNotEmpty) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  final item = list[index];
                                  return BlocProvider(
                                    create: (context) =>
                                        getIt<FavoriteCryptocurrencyCubit>(),
                                    child: BlocListener<FavoriteCryptocurrencyCubit,
                                        FavoriteCryptocurrencyState>(
                                      listener: (context, state) {
                                        state.whenOrNull(
                                          failure: (message, statusCode) {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                SnackBar(
                                                  content: Text(message ??
                                                      S.current.unknown_error),
                                                ),
                                              );
                                          },
                                          success: () {
                                            context
                                                .read<CryptocurrencyListCubit>()
                                                .toggleFavorite(item.id);
                                          },
                                        );
                                      },
                                      child: Builder(builder: (context) {
                                        return CryptocurrencyItemWidget(
                                          item: item,
                                        );
                                      }),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 8,
                                  );
                                },
                                itemCount: list.length);
                          } else {
                            return Center(
                              child: Text(S.current.no_items_found_to_display),
                            );
                          }
                        },
                        failure: (message, statusCode) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(message ?? S.current.unknown_error),
                                const SizedBox(
                                  height: 12,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    context
                                        .read<CryptocurrencyListCubit>()
                                        .getList();
                                  },
                                  child: Text(S.current.retry),
                                )
                              ],
                            ),
                          );
                        },
                      ) ??
                      const SizedBox();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
