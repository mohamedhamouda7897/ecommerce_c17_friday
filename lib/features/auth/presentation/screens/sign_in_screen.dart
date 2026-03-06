import 'package:ecommerce_c17_frid/core/resources/assets_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/color_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/values_manager.dart';
import 'package:ecommerce_c17_frid/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_frid/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_c17_frid/core/widget/main_text_field.dart';
import 'package:ecommerce_c17_frid/core/widget/validators.dart';
import 'package:ecommerce_c17_frid/di.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_events.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.loginRequestStatus == RequestStatus.error) {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(title: Text(state.loginErrorMessage ?? "")),
              );
            }

            if (state.loginRequestStatus == RequestStatus.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (state.loginRequestStatus == RequestStatus.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s40.h),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(height: AppSize.s40.h),
                        Text(
                          'Welcome Back To Route',
                          style: getBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(height: AppSize.s50.h),
                        BuildTextField(
                          controller: emailController,
                          backgroundColor: ColorManager.white,
                          hint: 'enter your name',
                          label: 'User name',
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),
                        SizedBox(height: AppSize.s28.h),
                        BuildTextField(
                          controller: passwordController,
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: AppSize.s8.h),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(
                                  color: ColorManager.white,
                                ).copyWith(fontSize: FontSize.s18.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s60.h),
                        Center(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width * .8,
                            child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18,
                              ),
                              onTap: () {
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(width: AppSize.s8.w),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.signUpRoute,
                              ),
                              child: Text(
                                'Create Account',
                                style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                ).copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
