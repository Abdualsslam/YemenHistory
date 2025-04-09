import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/widgets/custom_btn.dart';
import 'package:yemenhistory/featuers/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/custom_text_field.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/terms_and_condition_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (value) {
                  BlocProvider.of<AuthCubit>(context).firstName = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (value) {
                  BlocProvider.of<AuthCubit>(context).lastName = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (value) {
                  BlocProvider.of<AuthCubit>(context).emailAddress = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (value) {
                  BlocProvider.of<AuthCubit>(context).password = value;
                },
              ),

              TermsAndConditionWidget(),
              SizedBox(height: 16),
              CustomBtn(
                text: AppStrings.signUp,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
