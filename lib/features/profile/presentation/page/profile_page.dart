import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/get_user_info/get_user_data_cubit.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetUserDataCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.profile),
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
              builder: (context, state) {
                return state.whenOrNull(
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      success: (userData) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  initialValue: userData?.name,
                                  decoration: InputDecoration(
                                    labelText: S.current.name,
                                    hintText: S.current.name,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: userData?.email,
                                  decoration: InputDecoration(
                                    labelText: S.current.email,
                                    hintText: S.current.email,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  initialValue: userData?.phoneNumber,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: S.current.phone_number,
                                    hintText: S.current.phone_number,
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.edit_rounded),
                                      onPressed: () {
                                        //todo
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        );
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
                                  context.read<GetUserDataCubit>().getUserData();
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
        }),
      ),
    );
  }
}
