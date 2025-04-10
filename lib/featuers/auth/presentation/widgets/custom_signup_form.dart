import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          // showToast("Account created successfully!", context);
          // Navigate to the next screen or show a success message
          customReplacementNavigate(context, '/home');
        } else if (state is SignupFailurState) {
          // Show an error message
          // showToast(state.error, context);

          // final materialBanner = MaterialBanner(
          //   /// need to set following properties for best effect of awesome_snackbar_content
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   forceActionsBelow: true,
          //   content: AwesomeSnackbarContent(
          //     title: 'Oh Hey!!',
          //     message: 'This is an example error message that will be shown in the body of materialBanner!',

          //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          //     contentType: ContentType.success,
          //     // to configure for material banner
          //     inMaterialBanner: true,
          //   ),
          //   actions: const [SizedBox.shrink()],
          // );

          // ScaffoldMessenger.of(context)
          //   ..hideCurrentMaterialBanner()
          //   ..showMaterialBanner(materialBanner);
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
                    color: authCubit.TermsAndConditionWidgetvalue == false ? AppColors.grey : null,
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
