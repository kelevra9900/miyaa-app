import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/features/login/presentation/widgets/form_login.dart';
import 'login_controller.dart';
import '../../../tools/custom_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecEmailModal = TextEditingController();
  GlobalKey<FormState> formkey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');
  GlobalKey<FormState> formkeyModal =
      GlobalKey<FormState>(debugLabel: '_modalForgotPasswordFormKey');

  @override
  void initState() {
    tecEmail.text = "admin@gmail.com";
    tecPassword.text = "123456789";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(loginController.notifier);
    var state = ref.watch(loginController);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 32.sp),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    CustomText(
                      'Inicia sesión',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 30.sp),
                    FormLogin(
                      pageController: controller,
                      pageState: state,
                      formkey: formkey,
                      formkeyModal: formkeyModal,
                      tecEmail: tecEmail,
                      tecPassword: tecPassword,
                      tecEmailModal: tecEmailModal,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
