import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/common/network/custom_catch_error.dart';
import '../../../../common/custom_colors.dart';
import '../../../../tools/routes.dart';
import '../login_controller.dart';
import '../login_state.dart';
import '../../../../tools/custom_text.dart';
import '../../../../tools/extensions/dimens_extension.dart';
import '../../../../tools/paths/paths_icons.dart';
import '../../../../widgets/buttons/primary_button.dart';
import '../../../../widgets/inputs/custom_text_form_field.dart';

class FormLogin extends StatefulWidget {
  final TextEditingController tecEmail;
  final TextEditingController tecPassword;
  final TextEditingController tecEmailModal;
  final GlobalKey<FormState> formkey;
  final GlobalKey<FormState> formkeyModal;
  final LoginController pageController;
  final LoginState pageState;

  const FormLogin({
    super.key,
    required this.tecEmail,
    required this.tecPassword,
    required this.formkey,
    required this.pageController,
    required this.pageState,
    required this.formkeyModal,
    required this.tecEmailModal,
  });

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: context.width(),
        child: Form(
          key: widget.formkey,
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Correo electrónico',
                prefixIconPath: icons.email,
                controller: widget.tecEmail,
                inputValueType: InputValueType.email,
                onChanged: (x) => widget.pageState.firtsValidation!
                    ? widget.formkey.currentState!.validate()
                    : null,
              ),
              SizedBox(height: 20.sp),
              CustomTextFormField(
                label: 'Contraseña',
                prefixIconPath: icons.password,
                controller: widget.tecPassword,
                suffixIconEnabled: true,
                inputValueType: InputValueType.password,
                onChanged: (x) => widget.pageState.firtsValidation!
                    ? widget.formkey.currentState!.validate()
                    : null,
              ),
              const Expanded(child: SizedBox(height: 10)),
              PrimaryButton(
                text: 'Iniciar sesión',
                isLoading: widget.pageState.isLoading,
                onPressed: () async => login(context),
              ),
              SizedBox(height: 32.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    '¿Olvidaste tu contraseña?',
                    fontSize: 14,
                  ),
                  InkWell(
                    onTap: () {
                      widget.tecEmailModal.clear();
                      // dialogs.showModalBottomDynamic(context,
                      //     child: ModalForgotPassword(
                      //       pageController: widget.pageController,
                      //       pageState: widget.pageState,
                      //       tecEmailModal: widget.tecEmailModal,
                      //       formkey: widget.formkeyModal,
                      //     ));
                    },
                    child: CustomText(
                      'Recupérala aquí',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: lightColors.primaryColor,
                      textDecoration: TextDecoration.underline,
                      height: 1.1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    if (widget.formkey.currentState!.validate()) {
      try {
        await widget.pageController.loginRepository.loginWithCredentials(
          email: widget.tecEmail.text,
          password: widget.tecPassword.text,
        );
        // UserDataResponse userData =
        //     await widget.pageController.loginRepository.getUserData();
        // String? tokenNotification = await secureStorage.tokenNotification;
        // if (userData.fcmToken != tokenNotification) {
        //   log("se guarda el token ==================================");
        //   await widget.pageController.notificationsRepository
        //       .updateFcmToken(tokenNotification ?? "");
        // }

        if (!context.mounted) return;
        context.go(Routes.dashboard);
        widget.pageController.setIsLoading(false);
      } catch (e) {
        widget.pageController.setIsLoading(false);
        customError.catchError(e: e, context: context);
      }
    }
  }
}
