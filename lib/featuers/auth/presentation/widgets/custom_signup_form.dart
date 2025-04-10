import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenhistory/core/functions/custom_toast.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/utils/app_colors.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/widgets/custom_btn.dart';
import 'package:yemenhistory/featuers/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/custom_text_field.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/terms_and_condition_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          // showToast("Account created successfully!");
          // Navigate to the next screen or show a success message
          customReplacementNavigate(context, '/signIn');
        } else if (state is SignupFailurState) {
          // Show an error message
          // showToast(state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.singnupFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (value) {
                  authCubit.firstName = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (value) {
                  authCubit.lastName = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (value) {
                  authCubit.emailAddress = value;
                },
              ),

              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (value) {
                  authCubit.password = value;
                },
              ),

              TermsAndConditionWidget(),
              SizedBox(height: 16),
              state is SignupLoadingState
                  ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                  : CustomBtn(
                    text: AppStrings.signUp,
                    color: authCubit.TermsAndConditionWidgetvalue == true ? AppColors.grey : null,
                    onPressed: () {
                      if (authCubit.TermsAndConditionWidgetvalue == true) {
                        if (authCubit.singnupFormKey.currentState!.validate()) {
                          // Call the sign-up method from the cubit
                          // You can also show a loading indicator here if needed
                          authCubit.signUpWithEmailAndPassword();
                        }
                      }
                    },
                  ),
            ],
          ),
        );
      },
    );
  }
}
