import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/update_phone_number_form_validator/update_phone_number_form_validator_cubit.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/update_user_phone_number/update_user_phone_number_cubit.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberEditorDialog extends StatefulWidget {
  const PhoneNumberEditorDialog({super.key});

  @override
  State<PhoneNumberEditorDialog> createState() => _PhoneNumberEditorDialogState();
}

class _PhoneNumberEditorDialogState extends State<PhoneNumberEditorDialog> {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UpdatePhoneNumberFormValidatorCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UpdateUserPhoneNumberCubit>(),
        ),
      ],
      child: BlocListener<UpdateUserPhoneNumberCubit, UpdateUserPhoneNumberState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message, statusCode) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(message ?? S.current.unknown_error)),
                );
            },
            success: (data) {
              Navigator.pop(context, data);
            },
          );
        },
        child: Builder(
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  const Icon(Icons.phone_android_rounded),
                  const SizedBox(width: 8),
                  Expanded(child: Text(S.current.edit_phone_number)),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.current.edit_phone_number_desc),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: S.current.phone_number,
                      hintText: S.current.accepted_phone_number_example,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      _onSubmitTap(context);
                    },
                    validator: (value) {
                      return context
                          .read<UpdatePhoneNumberFormValidatorCubit>()
                          .validatePhoneNumber(value ?? '');
                    },
                  ),
                ],
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.current.cancel),
                ),
                BlocBuilder<UpdatePhoneNumberFormValidatorCubit,
                    UpdatePhoneNumberFormValidatorState>(
                  builder: (context, state) {
                    return state.whenOrNull(
                          invalid: () {
                            return ElevatedButton(
                              onPressed: null,
                              child: Text(S.current.submit),
                            );
                          },
                        ) ??
                        BlocBuilder<UpdateUserPhoneNumberCubit,
                            UpdateUserPhoneNumberState>(
                          builder: (context, state) {
                            return state.whenOrNull(
                                  loading: () {
                                    return const ElevatedButton(
                                      onPressed: null,
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator()),
                                    );
                                  },
                                ) ??
                                ElevatedButton(
                                  onPressed: () {
                                    _onSubmitTap(context);
                                  },
                                  child: Text(S.current.submit),
                                );
                          },
                        );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _onSubmitTap(BuildContext context) {
    FocusScope.of(context).unfocus();
    context
        .read<UpdateUserPhoneNumberCubit>()
        .updatePhoneNumber(_phoneNumberController.text);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
