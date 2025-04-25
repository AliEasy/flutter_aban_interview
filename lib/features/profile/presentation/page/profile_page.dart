import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter_aban_interview/features/profile/presentation/widget/phone_number_editor_dialog.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<GetUserDataCubit>();
        cubit.getUserData();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.profile),
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: BlocConsumer<GetUserDataCubit, GetUserDataState>(
                listener: (context, state) {
                  state.whenOrNull(success: (userData) {
                    _phoneNumberController.text = userData?.phoneNumber ?? '';
                  },);
                },
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
                                    controller: _phoneNumberController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: S.current.phone_number,
                                      hintText: S.current.phone_number,
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.edit_rounded),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const PhoneNumberEditorDialog();
                                            },
                                          ).then(
                                            (value) {
                                              if (value
                                                  is UpdateUserDataResponseEntity) {
                                                _phoneNumberController.text =
                                                    value.phoneNumber ?? '';
                                              }
                                            },
                                          );
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
                                Text(message ?? S.current.unknown_error, textAlign: TextAlign.center),
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
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
