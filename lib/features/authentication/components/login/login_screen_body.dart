import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:detection_app/features/authentication/components/common/alert.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_button.dart';
import '../../../../../core/constant/app_constant.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/helpers/spacing.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetUserDataSuccessState) {
          showAlertDialog(
            context,
            title: AppLocalizations.of(context)!.loginSuccess,
            image: Assets.imagesConfrim,
            isCancel: false,
            onPressed: () {
              context.navigateAndFinishNyNamed(context, RoutePath.home);
            },
          );
        } else if (state is FailureState) {
          // showToast(message: state.error, state: ToastState.ERROR);
          showAlertDialog(
            context,
            title: AppLocalizations.of(context)!.registerError,
            image: Assets.imagesCancel,
            isCancel: true,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.loginScreenTitlePartOne,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginDesc,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Spacing.verticalSpace(30),
                      CustomTwoTextFromField(
                        controller1: emailController,
                        controller2: passController,
                        hint1: AppLocalizations.of(context)!.loginScreenEmail,
                        hint2: AppLocalizations.of(context)!.loginScreenPass,
                      ),
                      Spacing.verticalSpace(15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            context.navigateToWidgetByNamed(
                                context, RoutePath.forgetPass);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.loginScreenForgetPass,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: (AppColors.kGreyColor),
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ),
                      ),
                      Spacing.verticalSpace(20),
                      ConditionalBuilder(
                          condition: state is! LoadingState,
                          builder: (context) => CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passController.text);
                                    // context
                                    //     .read<AuthCubit>()
                                    //     .uploadJsonDataToFirestore();
                                  }
                                },
                                text: AppLocalizations.of(context)!
                                    .loginScreenButton,
                                color: AppColors.kPrimaryColor,
                                width: AppConstant.deviceWidth(context),
                                radius: 10,
                              ),
                          fallback: (context) =>
                              const CustomLoadingIndicator()),
                      Spacing.verticalSpace(25),
                      Spacing.verticalSpace(20),
                      customTextNextToTextButton(
                        context: context,
                        text: AppLocalizations.of(context)!
                            .loginScreenHaveNotAccount,
                        textButton: AppLocalizations.of(context)!
                            .loginScreenCreateAccount,
                        onPressed: () {
                          context.navigateToWidgetByNamed(
                              context, RoutePath.register);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
