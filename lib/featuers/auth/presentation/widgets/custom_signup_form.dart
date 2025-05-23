import 'package:yemenhistory/core/functions/custom_toast.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/utils/app_colors.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenhistory/featuers/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:yemenhistory/featuers/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/custom_text_field.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/terms_and_condition_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          // showToast("Successfully,Check your email to verfiy your account");
          customReplacementNavigate(context, "/signIn");
        } else if (state is SignupFailureState) {
          print(state.errMessage);
          // showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(authCubit.obscurePasswordTextValue == true ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndConditionWidget(),
              const SizedBox(height: 88),
              state is SignupLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                    color: authCubit.termsAndConditionCheckBoxValue == false ? AppColors.grey : null,
                    onPressed: () async {
                      if (authCubit.termsAndConditionCheckBoxValue == true) {
                        if (authCubit.signupFormKey.currentState!.validate()) {
                          await authCubit.signUpWithEmailAndPassword();
                        }
                      }
                    },
                    text: AppStrings.signUp,
                  ),
            ],
          ),
        );
      },
    );
  }
}
