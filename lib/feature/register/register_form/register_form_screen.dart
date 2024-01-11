import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/register_form_cubit.dart';


@RoutePage()
class RegisterFormScreen extends StatelessWidget {
  final String uid;
  final String phoneNumber;

  RegisterFormScreen({super.key, required this.uid, required this.phoneNumber});

  late RegisterFormCubit _cubit;
  late AnidoptDialog _dialog;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormCubit(),
      child: Builder(
          builder: (context) {
            _cubit = context.read();
            _dialog = AnidoptDialog(context);
            return _buildMainView(context);
          }
      ),
    );
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterFormCubit, RegisterFormState>(
        listener: (context, state) {
          if(state is RegisterFormStateLoading){
            _dialog.showLoading();

          } else if(state is RegisterFormStateSuccess){
            _dialog.dismiss();
            context.router.replaceAll([HomeNavigationRoute()]);
          } else if(state is RegisterFormStateError){
            _dialog.dismiss();
            _dialog.error(message: state.message);

          }
        },
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
