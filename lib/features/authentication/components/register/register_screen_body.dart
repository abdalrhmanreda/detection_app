import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/assets.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';
import '../common/alert.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import 'full_name.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is GetUserDataSuccessState) {
          showAlertDialog(
            context,
            title: AppLocalizations.of(context)!.registerSuccess,
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
                        AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.registerScreenDescription,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Spacing.verticalSpace(30),
                      TitleAndTextFormFeild(
                        nameController: nameController,
                        title: AppLocalizations.of(context)!.registerFullName,
                        hint: 'xxxxxxxxx',
                      ),
                      Spacing.verticalSpace(20),
                      TitleAndTextFormFeild(
                        nameController: phoneController,
                        title: 'Phone',
                        hint: '+20100000000',
                      ),
                      Spacing.verticalSpace(20),
                      CustomTwoTextFromField(
                        controller1: emailController,
                        controller2: passController,
                        hint1: AppLocalizations.of(context)!.loginScreenEmail,
                        hint2: AppLocalizations.of(context)!.loginScreenPass,
                      ),
                      Spacing.verticalSpace(30),
                      ConditionalBuilder(
                        condition: state is! LoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passController.text,
                                  name: nameController.text,
                                  phone: phoneController.text);
                            }
                          },
                          text: AppLocalizations.of(context)!.signUp,
                          color: AppColors.kPrimaryColor,
                          width: AppConstant.deviceWidth(context),
                          radius: 10,
                        ),
                        fallback: (context) => const CustomLoadingIndicator(),
                      ),
                      Spacing.verticalSpace(20),
                      Spacing.verticalSpace(10),
                      customTextNextToTextButton(
                          context: context,
                          text: AppLocalizations.of(context)!
                              .registerScreenHaveAccount,
                          textButton:
                              AppLocalizations.of(context)!.loginScreenButton,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
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
