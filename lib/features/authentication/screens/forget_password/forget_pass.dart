import 'package:detection_app/core/components/custom_button.dart';
import 'package:detection_app/core/helpers/spacing.dart';
import 'package:detection_app/features/authentication/components/common/container_with_text_from_feild.dart';
import 'package:detection_app/features/authentication/controller/auth_state.dart';
import 'package:detection_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_constant.dart';
import '../../controller/auth_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Check your email'),
            duration: Duration(seconds: 3), // Adjust duration as needed
          ),
        );
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 25.h,
            ),
            child: Column(
              children: [
                Image.asset(Assets.imagesForgotpasswordCuate),
                Spacing.verticalSpace(20),
                ContainerTextFormFeild(
                  isPass: false,
                  controller: emailController,
                  hint: AppLocalizations.of(context)!.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                Spacing.verticalSpace(20),
                CustomButton(
                  onPressed: () {
                    context
                        .read<AuthCubit>()
                        .resetPassword(emailController.text);
                  },
                  text: AppLocalizations.of(context)!.restPass,
                  width: AppConstant.deviceWidth(context),
                  radius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
