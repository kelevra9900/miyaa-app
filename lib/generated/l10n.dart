// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading, please wait...`
  String get loaderWaitPlease {
    return Intl.message(
      'Loading, please wait...',
      name: 'loaderWaitPlease',
      desc: '',
      args: [],
    );
  }

  /// `Loading payment information...`
  String get loaderPaymentInfo {
    return Intl.message(
      'Loading payment information...',
      name: 'loaderPaymentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get unexpectedError {
    return Intl.message(
      'Something went wrong',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Server not responding`
  String get serverNotResponding {
    return Intl.message(
      'Server not responding',
      name: 'serverNotResponding',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get buttonCancel {
    return Intl.message(
      'Cancel',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get buttonAccept {
    return Intl.message(
      'Accept',
      name: 'buttonAccept',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get buttonContinue {
    return Intl.message(
      'Continue',
      name: 'buttonContinue',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get buttonDelete {
    return Intl.message(
      'Delete',
      name: 'buttonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get buttonYes {
    return Intl.message(
      'Yes',
      name: 'buttonYes',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get firtsTextMesageOnboardingOne {
    return Intl.message(
      'Welcome',
      name: 'firtsTextMesageOnboardingOne',
      desc: '',
      args: [],
    );
  }

  /// ` to a healthier lifestyle`
  String get secondTextMesageOnboardingOne {
    return Intl.message(
      ' to a healthier lifestyle',
      name: 'secondTextMesageOnboardingOne',
      desc: '',
      args: [],
    );
  }

  /// `Medical emergency?`
  String get firtsTextMesageOnboardingTwo {
    return Intl.message(
      'Medical emergency?',
      name: 'firtsTextMesageOnboardingTwo',
      desc: '',
      args: [],
    );
  }

  /// `\nDoctors Net at your service`
  String get secondTextMesageOnboardingTwo {
    return Intl.message(
      '\nDoctors Net at your service',
      name: 'secondTextMesageOnboardingTwo',
      desc: '',
      args: [],
    );
  }

  /// `Wide variety of healthcare services`
  String get firtsTextMesageOnboardingThree {
    return Intl.message(
      'Wide variety of healthcare services',
      name: 'firtsTextMesageOnboardingThree',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get secondTextMesageOnboardingThree {
    return Intl.message(
      '',
      name: 'secondTextMesageOnboardingThree',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to continue with your registration?`
  String get splashScreenModalVerifyEmailTitle {
    return Intl.message(
      'Do you want to continue with your registration?',
      name: 'splashScreenModalVerifyEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have an active registration process with email`
  String get splashScreenModalVerifyEmailSubtitle {
    return Intl.message(
      'You have an active registration process with email',
      name: 'splashScreenModalVerifyEmailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we were unable to resume the process.`
  String get splashScreenModalVerifyEmailError {
    return Intl.message(
      'Sorry, we were unable to resume the process.',
      name: 'splashScreenModalVerifyEmailError',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an active membership`
  String get splashScreenModalMembershipTitle {
    return Intl.message(
      'You do not have an active membership',
      name: 'splashScreenModalMembershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `You currently do not have an active membership, would you like to purchase one?`
  String get splashScreenModalMembershipSubtitle {
    return Intl.message(
      'You currently do not have an active membership, would you like to purchase one?',
      name: 'splashScreenModalMembershipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get splashScreenModalLocationTitle {
    return Intl.message(
      'Attention',
      name: 'splashScreenModalLocationTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you do not accept location permissions you will not be able to access all the information available in our app.`
  String get splashScreenModalLocationSubitle {
    return Intl.message(
      'If you do not accept location permissions you will not be able to access all the information available in our app.',
      name: 'splashScreenModalLocationSubitle',
      desc: '',
      args: [],
    );
  }

  /// `Your location access has not been authorized. Please grant permissions from your phone settings to continue.`
  String get splashScreenModalLocationSubitle2 {
    return Intl.message(
      'Your location access has not been authorized. Please grant permissions from your phone settings to continue.',
      name: 'splashScreenModalLocationSubitle2',
      desc: '',
      args: [],
    );
  }

  /// `Discover a new way\nto take care of your health`
  String get homeTitle {
    return Intl.message(
      'Discover a new way\nto take care of your health',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let's promote your well-being together.`
  String get homeSubtitle {
    return Intl.message(
      'Let\'s promote your well-being together.',
      name: 'homeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get homeTextPrimaryButton {
    return Intl.message(
      'Sign up',
      name: 'homeTextPrimaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get homeTextSecundaryButton {
    return Intl.message(
      'Log in',
      name: 'homeTextSecundaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginTitle {
    return Intl.message(
      'Log in',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get loginPatient {
    return Intl.message(
      'Patient',
      name: 'loginPatient',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get loginDoctor {
    return Intl.message(
      'Doctor',
      name: 'loginDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginInputEmail {
    return Intl.message(
      'Email',
      name: 'loginInputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginInputPassword {
    return Intl.message(
      'Password',
      name: 'loginInputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Keep session`
  String get loginCheckBox {
    return Intl.message(
      'Keep session',
      name: 'loginCheckBox',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginPrimaryButton {
    return Intl.message(
      'Log in',
      name: 'loginPrimaryButton',
      desc: '',
      args: [],
    );
  }

  /// `I forgot my `
  String get loginfirstTextForgotPassword {
    return Intl.message(
      'I forgot my ',
      name: 'loginfirstTextForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get loginSecondTextForgotPassword {
    return Intl.message(
      'password',
      name: 'loginSecondTextForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgotten password?`
  String get loginModalForgotPasswordTitle {
    return Intl.message(
      'Forgotten password?',
      name: 'loginModalForgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a reset link to your registered email.`
  String get loginModalForgotPasswordSubtitle {
    return Intl.message(
      'We will send you a reset link to your registered email.',
      name: 'loginModalForgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginModalInputEmail {
    return Intl.message(
      'Email',
      name: 'loginModalInputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get loginModalPrimaryButton {
    return Intl.message(
      'Verify',
      name: 'loginModalPrimaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verificationCodetitle {
    return Intl.message(
      'Verification',
      name: 'verificationCodetitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification by code`
  String get verificationCodetitleTwo {
    return Intl.message(
      'Verification by code',
      name: 'verificationCodetitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a verification code to your email. Please enter it to verify your account.`
  String get verificationCodesubtitle {
    return Intl.message(
      'We have sent a verification code to your email. Please enter it to verify your account.',
      name: 'verificationCodesubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your code expires in:`
  String get verificationCodeExpires {
    return Intl.message(
      'Your code expires in:',
      name: 'verificationCodeExpires',
      desc: '',
      args: [],
    );
  }

  /// `Have you not received the code?`
  String get verificationCodeTextNoCode {
    return Intl.message(
      'Have you not received the code?',
      name: 'verificationCodeTextNoCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get verificationCodeResendCode {
    return Intl.message(
      'Resend',
      name: 'verificationCodeResendCode',
      desc: '',
      args: [],
    );
  }

  /// `The email has been verified, now we will continue with your identity validation.`
  String get verificationCodeModalSubtitle {
    return Intl.message(
      'The email has been verified, now we will continue with your identity validation.',
      name: 'verificationCodeModalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Verified code`
  String get modalVerificationCodeTitleValid {
    return Intl.message(
      'Verified code',
      name: 'modalVerificationCodeTitleValid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get modalVerificationCodeTitleInvalid {
    return Intl.message(
      'Invalid code',
      name: 'modalVerificationCodeTitleInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Code successfully confirmed, you can proceed to change the password.`
  String get modalVerificationCodesubtitleValid {
    return Intl.message(
      'Code successfully confirmed, you can proceed to change the password.',
      name: 'modalVerificationCodesubtitleValid',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get modalVerificationCodeChangePasswordButton {
    return Intl.message(
      'Change password',
      name: 'modalVerificationCodeChangePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Go to identity verification`
  String get modalVerificationCodeGoToIdentityVerifyButton {
    return Intl.message(
      'Go to identity verification',
      name: 'modalVerificationCodeGoToIdentityVerifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get formChangePasswordInputOne {
    return Intl.message(
      'Password',
      name: 'formChangePasswordInputOne',
      desc: '',
      args: [],
    );
  }

  /// `Enter and confirm your new password.`
  String get formChangePasswordSubtitble {
    return Intl.message(
      'Enter and confirm your new password.',
      name: 'formChangePasswordSubtitble',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get formChangePasswordInputTwo {
    return Intl.message(
      'Confirm Password',
      name: 'formChangePasswordInputTwo',
      desc: '',
      args: [],
    );
  }

  /// `Password change successful`
  String get modalTitleSuccessChangePassword {
    return Intl.message(
      'Password change successful',
      name: 'modalTitleSuccessChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully.`
  String get modalTitleSuccessChangeMessage {
    return Intl.message(
      'Password changed successfully.',
      name: 'modalTitleSuccessChangeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Back to top`
  String get modalTextButtonBackToTop {
    return Intl.message(
      'Back to top',
      name: 'modalTextButtonBackToTop',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get SignInTitle {
    return Intl.message(
      'Create account',
      name: 'SignInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get SignInName {
    return Intl.message(
      'Name',
      name: 'SignInName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get SignInLastName {
    return Intl.message(
      'Last Name',
      name: 'SignInLastName',
      desc: '',
      args: [],
    );
  }

  /// `Second surname`
  String get SignInSecondLastName {
    return Intl.message(
      'Second surname',
      name: 'SignInSecondLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get SignInEmail {
    return Intl.message(
      'Email',
      name: 'SignInEmail',
      desc: '',
      args: [],
    );
  }

  /// `Telephone`
  String get SignInTelephone {
    return Intl.message(
      'Telephone',
      name: 'SignInTelephone',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get SignInBirthDay {
    return Intl.message(
      'Date of birth',
      name: 'SignInBirthDay',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get SignInGender {
    return Intl.message(
      'Gender',
      name: 'SignInGender',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get SignInCountry {
    return Intl.message(
      'Country',
      name: 'SignInCountry',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get SignInCodeZip {
    return Intl.message(
      'Zip Code',
      name: 'SignInCodeZip',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get SignInCity {
    return Intl.message(
      'City',
      name: 'SignInCity',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get SignInPassword {
    return Intl.message(
      'Password',
      name: 'SignInPassword',
      desc: '',
      args: [],
    );
  }

  /// `You then agree to the`
  String get SignInTextOne {
    return Intl.message(
      'You then agree to the',
      name: 'SignInTextOne',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get SignInTextTwo {
    return Intl.message(
      'Terms and conditions',
      name: 'SignInTextTwo',
      desc: '',
      args: [],
    );
  }

  /// `Do you agree that your health data be shared? `
  String get SignInTextThree {
    return Intl.message(
      'Do you agree that your health data be shared? ',
      name: 'SignInTextThree',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get SignInTextFour {
    return Intl.message(
      'Read more',
      name: 'SignInTextFour',
      desc: '',
      args: [],
    );
  }

  /// `Authorization`
  String get SignInTextFive {
    return Intl.message(
      'Authorization',
      name: 'SignInTextFive',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account, sign in `
  String get SignInTextSix {
    return Intl.message(
      'I already have an account, sign in ',
      name: 'SignInTextSix',
      desc: '',
      args: [],
    );
  }

  /// `here`
  String get SignInTextSeven {
    return Intl.message(
      'here',
      name: 'SignInTextSeven',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get signinModalBirthdayTitle {
    return Intl.message(
      'Date of birth',
      name: 'signinModalBirthdayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select your specific date of birth from the calendar to continue.`
  String get siginModalBirthdaySubtitle {
    return Intl.message(
      'Select your specific date of birth from the calendar to continue.',
      name: 'siginModalBirthdaySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Define`
  String get signinModalBirthdayTextButton {
    return Intl.message(
      'Define',
      name: 'signinModalBirthdayTextButton',
      desc: '',
      args: [],
    );
  }

  /// `Loading Please wait...`
  String get LoadingText {
    return Intl.message(
      'Loading Please wait...',
      name: 'LoadingText',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get ButtonTextRetry {
    return Intl.message(
      'Retry',
      name: 'ButtonTextRetry',
      desc: '',
      args: [],
    );
  }

  /// `Verify identity`
  String get JumioTitle {
    return Intl.message(
      'Verify identity',
      name: 'JumioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please upload a clear image of your ID document. Make sure all details are legible. This process is necessary to maintain the integrity of our platform and protect your data.`
  String get JumioSubtitle {
    return Intl.message(
      'Please upload a clear image of your ID document. Make sure all details are legible. This process is necessary to maintain the integrity of our platform and protect your data.',
      name: 'JumioSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Selfie verification successful`
  String get JumioModalTitleSuccess {
    return Intl.message(
      'Selfie verification successful',
      name: 'JumioModalTitleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Your identity has been successfully verified! You can now purchase a membership to use all Doctors Net services.`
  String get JumioModalSubtitleSuccess {
    return Intl.message(
      'Your identity has been successfully verified! You can now purchase a membership to use all Doctors Net services.',
      name: 'JumioModalSubtitleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Selfie Verification Failed`
  String get JumioModalTitleFail {
    return Intl.message(
      'Selfie Verification Failed',
      name: 'JumioModalTitleFail',
      desc: '',
      args: [],
    );
  }

  /// `Your selfie has not been verified successfully, try again later!`
  String get JumioModalSubtitleFail {
    return Intl.message(
      'Your selfie has not been verified successfully, try again later!',
      name: 'JumioModalSubtitleFail',
      desc: '',
      args: [],
    );
  }

  /// `Memberships`
  String get JumioButtonSuccess {
    return Intl.message(
      'Memberships',
      name: 'JumioButtonSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get modalRegisterExitTitle {
    return Intl.message(
      'Are you sure?',
      name: 'modalRegisterExitTitle',
      desc: '',
      args: [],
    );
  }

  /// `You will lose your registration progress and have to start over.`
  String get modalRegisterExitSubtitle {
    return Intl.message(
      'You will lose your registration progress and have to start over.',
      name: 'modalRegisterExitSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Use permission`
  String get modalRegisterAuthorizeBiometricsTitle {
    return Intl.message(
      'Use permission',
      name: 'modalRegisterAuthorizeBiometricsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you agree to the use of your biometric information to log in?`
  String get modalRegisterAuthorizeBiometricsSubtitle {
    return Intl.message(
      'Do you agree to the use of your biometric information to log in?',
      name: 'modalRegisterAuthorizeBiometricsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You will miss out on the great benefits that Doctors Net has for you`
  String get modalOutMembershipSubtitle {
    return Intl.message(
      'You will miss out on the great benefits that Doctors Net has for you',
      name: 'modalOutMembershipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get ValidateTextRequiredField {
    return Intl.message(
      'Required field',
      name: 'ValidateTextRequiredField',
      desc: '',
      args: [],
    );
  }

  /// `Enter an email`
  String get validatorEmailOne {
    return Intl.message(
      'Enter an email',
      name: 'validatorEmailOne',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validatorEmailTwo {
    return Intl.message(
      'Please enter a valid email',
      name: 'validatorEmailTwo',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters`
  String get validatorPasswordOne {
    return Intl.message(
      'Must be at least 8 characters',
      name: 'validatorPasswordOne',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get validatorChangePasswordOne {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'validatorChangePasswordOne',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get validatorChangePasswordTwo {
    return Intl.message(
      'Password must contain at least one number',
      name: 'validatorChangePasswordTwo',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get validatorChangePasswordThree {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'validatorChangePasswordThree',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get validatorChangePasswordFour {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'validatorChangePasswordFour',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character`
  String get validatorChangePasswordFive {
    return Intl.message(
      'Password must contain at least one special character',
      name: 'validatorChangePasswordFive',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid cell phone number`
  String get validatorPhoneOne {
    return Intl.message(
      'Enter a valid cell phone number',
      name: 'validatorPhoneOne',
      desc: '',
      args: [],
    );
  }

  /// `Enter your ID number`
  String get validatorDocumentOne {
    return Intl.message(
      'Enter your ID number',
      name: 'validatorDocumentOne',
      desc: '',
      args: [],
    );
  }

  /// `You must fill out a valid document`
  String get validatorDocumentTwo {
    return Intl.message(
      'You must fill out a valid document',
      name: 'validatorDocumentTwo',
      desc: '',
      args: [],
    );
  }

  /// `Invalid text, select an option`
  String get validatorDropdownOne {
    return Intl.message(
      'Invalid text, select an option',
      name: 'validatorDropdownOne',
      desc: '',
      args: [],
    );
  }

  /// `Do not match`
  String get validatorMatchValue {
    return Intl.message(
      'Do not match',
      name: 'validatorMatchValue',
      desc: '',
      args: [],
    );
  }

  /// `The credentials are incorrect`
  String get firebaseLoginErrorResponseCredentialError {
    return Intl.message(
      'The credentials are incorrect',
      name: 'firebaseLoginErrorResponseCredentialError',
      desc: '',
      args: [],
    );
  }

  /// `The email is already registered.`
  String get firebaseSignInErrorResponseFail {
    return Intl.message(
      'The email is already registered.',
      name: 'firebaseSignInErrorResponseFail',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error, please try again later`
  String get firebaseLoginErrorResponseFail {
    return Intl.message(
      'Unexpected error, please try again later',
      name: 'firebaseLoginErrorResponseFail',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get homeHello {
    return Intl.message(
      'Hello',
      name: 'homeHello',
      desc: '',
      args: [],
    );
  }

  /// `Let's take care of your well-being together.`
  String get homeHello2 {
    return Intl.message(
      'Let\'s take care of your well-being together.',
      name: 'homeHello2',
      desc: '',
      args: [],
    );
  }

  /// `Search for articles, medications...`
  String get homeInputHintext {
    return Intl.message(
      'Search for articles, medications...',
      name: 'homeInputHintext',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get homeCategories {
    return Intl.message(
      'Categories',
      name: 'homeCategories',
      desc: '',
      args: [],
    );
  }

  /// `Closer to you`
  String get homeLocationCardTitle {
    return Intl.message(
      'Closer to you',
      name: 'homeLocationCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Locate hospitals, clinics, pharmacies and more around you.`
  String get homeLocationCardSubtitle {
    return Intl.message(
      'Locate hospitals, clinics, pharmacies and more around you.',
      name: 'homeLocationCardSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get homeTitleSoon {
    return Intl.message(
      'Coming soon',
      name: 'homeTitleSoon',
      desc: '',
      args: [],
    );
  }

  /// `Top Clinics`
  String get homeTitleTopClinics {
    return Intl.message(
      'Top Clinics',
      name: 'homeTitleTopClinics',
      desc: '',
      args: [],
    );
  }

  /// `Top Laboratories`
  String get homeTitleTopLaboratories {
    return Intl.message(
      'Top Laboratories',
      name: 'homeTitleTopLaboratories',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get homeSeeMore {
    return Intl.message(
      'See more',
      name: 'homeSeeMore',
      desc: '',
      args: [],
    );
  }

  /// `We are loading your data...`
  String get homeLoadingMessage {
    return Intl.message(
      'We are loading your data...',
      name: 'homeLoadingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Previous searches`
  String get modalSearchPreviousSearches {
    return Intl.message(
      'Previous searches',
      name: 'modalSearchPreviousSearches',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get modalSearchDelete {
    return Intl.message(
      'Delete',
      name: 'modalSearchDelete',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get modalSearchLabelButton {
    return Intl.message(
      'Search',
      name: 'modalSearchLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get modalSearchNoResults {
    return Intl.message(
      'No results',
      name: 'modalSearchNoResults',
      desc: '',
      args: [],
    );
  }

  /// `No results found. Try expanding your search range using the filters icon or try different text.`
  String get modalSearchNoResultsSubtitle {
    return Intl.message(
      'No results found. Try expanding your search range using the filters icon or try different text.',
      name: 'modalSearchNoResultsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred in the search`
  String get modalSearchError {
    return Intl.message(
      'An error occurred in the search',
      name: 'modalSearchError',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get modalFilterTilte {
    return Intl.message(
      'Filter',
      name: 'modalFilterTilte',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get modalFilterReset {
    return Intl.message(
      'Reset',
      name: 'modalFilterReset',
      desc: '',
      args: [],
    );
  }

  /// `By category`
  String get modalFilterForCategory {
    return Intl.message(
      'By category',
      name: 'modalFilterForCategory',
      desc: '',
      args: [],
    );
  }

  /// `By location`
  String get modalFilterForLocation {
    return Intl.message(
      'By location',
      name: 'modalFilterForLocation',
      desc: '',
      args: [],
    );
  }

  /// `Up to`
  String get modalFilterForLocation2 {
    return Intl.message(
      'Up to',
      name: 'modalFilterForLocation2',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get modalFilterLabelButton {
    return Intl.message(
      'Apply',
      name: 'modalFilterLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `See more information`
  String get mapCardInfoLabelButton {
    return Intl.message(
      'See more information',
      name: 'mapCardInfoLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get mapCardInfoModalAttentionTitle {
    return Intl.message(
      'Attention',
      name: 'mapCardInfoModalAttentionTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are selecting a provider outside the Doctors Net coverage network, therefore the services you receive are not included in your membership.`
  String get mapCardInfoModalAttentionSubtitle {
    return Intl.message(
      'You are selecting a provider outside the Doctors Net coverage network, therefore the services you receive are not included in your membership.',
      name: 'mapCardInfoModalAttentionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `No membership`
  String get profileMembership {
    return Intl.message(
      'No membership',
      name: 'profileMembership',
      desc: '',
      args: [],
    );
  }

  /// `Membership benefits`
  String get profileOptionsBenefits {
    return Intl.message(
      'Membership benefits',
      name: 'profileOptionsBenefits',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get profileOptionsUpdateProfile {
    return Intl.message(
      'Edit profile',
      name: 'profileOptionsUpdateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get profileOptionsPaymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'profileOptionsPaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profileOptionsSettings {
    return Intl.message(
      'Settings',
      name: 'profileOptionsSettings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profileButtonLogout {
    return Intl.message(
      'Logout',
      name: 'profileButtonLogout',
      desc: '',
      args: [],
    );
  }

  /// `Register Data`
  String get profileRegisterData {
    return Intl.message(
      'Register Data',
      name: 'profileRegisterData',
      desc: '',
      args: [],
    );
  }

  /// `Member since: `
  String get profileMemberSince {
    return Intl.message(
      'Member since: ',
      name: 'profileMemberSince',
      desc: '',
      args: [],
    );
  }

  /// `Membership valid until:`
  String get profileMembershipValidUntil {
    return Intl.message(
      'Membership valid until:',
      name: 'profileMembershipValidUntil',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out of Doctors Net? You will be able to log in again with your login details.`
  String get profileModalSubtitle {
    return Intl.message(
      'Are you sure you want to log out of Doctors Net? You will be able to log in again with your login details.',
      name: 'profileModalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get updateProfileTitle {
    return Intl.message(
      'Edit profile',
      name: 'updateProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get updateProfileCountry {
    return Intl.message(
      'Country',
      name: 'updateProfileCountry',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get updateProfileCity {
    return Intl.message(
      'City',
      name: 'updateProfileCity',
      desc: '',
      args: [],
    );
  }

  /// `Shared health information`
  String get updateProfileFooterText1 {
    return Intl.message(
      'Shared health information',
      name: 'updateProfileFooterText1',
      desc: '',
      args: [],
    );
  }

  /// `Here`
  String get updateProfileFooterText2 {
    return Intl.message(
      'Here',
      name: 'updateProfileFooterText2',
      desc: '',
      args: [],
    );
  }

  /// `and ours`
  String get updateProfileFooterText3 {
    return Intl.message(
      'and ours',
      name: 'updateProfileFooterText3',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get updateProfileFooterText4 {
    return Intl.message(
      'Terms and conditions',
      name: 'updateProfileFooterText4',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get updateProfileSaveChanges {
    return Intl.message(
      'Save changes',
      name: 'updateProfileSaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get updateProfileChangePassword {
    return Intl.message(
      'Change password',
      name: 'updateProfileChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Check the characters entered and change your password correctly`
  String get updateProfileChangePasswordSubtitle {
    return Intl.message(
      'Check the characters entered and change your password correctly',
      name: 'updateProfileChangePasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get updateProfileCurrentPassword {
    return Intl.message(
      'Current Password',
      name: 'updateProfileCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get updateProfileNewPassword {
    return Intl.message(
      'New password',
      name: 'updateProfileNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get updateProfileConfrimPassword {
    return Intl.message(
      'Confirm password',
      name: 'updateProfileConfrimPassword',
      desc: '',
      args: [],
    );
  }

  /// `Benefits`
  String get benefitsTitle {
    return Intl.message(
      'Benefits',
      name: 'benefitsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remember that with your active Doctors Net membership, you will be guaranteed the following benefits:`
  String get benefitsSubtitle {
    return Intl.message(
      'Remember that with your active Doctors Net membership, you will be guaranteed the following benefits:',
      name: 'benefitsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Membership valid until:`
  String get benefitsMembershipValidUntil {
    return Intl.message(
      'Membership valid until:',
      name: 'benefitsMembershipValidUntil',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Membership`
  String get profileCancelMembership {
    return Intl.message(
      'Cancel Membership',
      name: 'profileCancelMembership',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get settingsButtonNotifications {
    return Intl.message(
      'Notifications',
      name: 'settingsButtonNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get settingsButtonTheme {
    return Intl.message(
      'Light mode',
      name: 'settingsButtonTheme',
      desc: '',
      args: [],
    );
  }

  /// `Login with biometric reader`
  String get settingsButtonUseBiometrics {
    return Intl.message(
      'Login with biometric reader',
      name: 'settingsButtonUseBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Face ID login`
  String get settingsButtonUseBiometricsFaceId {
    return Intl.message(
      'Face ID login',
      name: 'settingsButtonUseBiometricsFaceId',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get settingsButtonLanguagesEs {
    return Intl.message(
      'Spanish',
      name: 'settingsButtonLanguagesEs',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get settingsButtonLanguagesEn {
    return Intl.message(
      'English',
      name: 'settingsButtonLanguagesEn',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethodsTitle {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethodsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Debit/Credit Cards`
  String get paymentMethodsSubtitleOne {
    return Intl.message(
      'Debit/Credit Cards',
      name: 'paymentMethodsSubtitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Cryptocurrencies`
  String get paymentMethodsSubtitleTwo {
    return Intl.message(
      'Cryptocurrencies',
      name: 'paymentMethodsSubtitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Spei - Bank transfers`
  String get paymentMethodsSubtitleThree {
    return Intl.message(
      'Spei - Bank transfers',
      name: 'paymentMethodsSubtitleThree',
      desc: '',
      args: [],
    );
  }

  /// `Add a card`
  String get paymentMethodsButtonAddNewCard {
    return Intl.message(
      'Add a card',
      name: 'paymentMethodsButtonAddNewCard',
      desc: '',
      args: [],
    );
  }

  /// `You will lose your payment information and will have to generate another payment code`
  String get paymentOutSubtitle {
    return Intl.message(
      'You will lose your payment information and will have to generate another payment code',
      name: 'paymentOutSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Cryptocurrency`
  String get crypto {
    return Intl.message(
      'Cryptocurrency',
      name: 'crypto',
      desc: '',
      args: [],
    );
  }

  /// `Total payment: `
  String get paymentTotal {
    return Intl.message(
      'Total payment: ',
      name: 'paymentTotal',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Add card`
  String get addCardTitle {
    return Intl.message(
      'Add card',
      name: 'addCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder name`
  String get addCardInputName {
    return Intl.message(
      'Cardholder name',
      name: 'addCardInputName',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get addCardInputCardNumber {
    return Intl.message(
      'Card number',
      name: 'addCardInputCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiration`
  String get addCardInputExpiration {
    return Intl.message(
      'Expiration',
      name: 'addCardInputExpiration',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get addCardInputCvv {
    return Intl.message(
      'CVV',
      name: 'addCardInputCvv',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addCardInputAddress {
    return Intl.message(
      'Address',
      name: 'addCardInputAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addCardInputLabelButton {
    return Intl.message(
      'Add',
      name: 'addCardInputLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get addCardInputLabelHintextExpiration {
    return Intl.message(
      'MM/YY',
      name: 'addCardInputLabelHintextExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Delete card?`
  String get cardDeleteModalTitle {
    return Intl.message(
      'Delete card?',
      name: 'cardDeleteModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the card **** **** ****`
  String get cardDeleteModalSubtitle {
    return Intl.message(
      'Are you sure you want to delete the card **** **** ****',
      name: 'cardDeleteModalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `of your payment methods?`
  String get cardDeleteModalSubtitle2 {
    return Intl.message(
      'of your payment methods?',
      name: 'cardDeleteModalSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Memberships`
  String get membershipTitle {
    return Intl.message(
      'Memberships',
      name: 'membershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remember that with your active Doctors Net membership, you will be guaranteed the following benefits:`
  String get membershipSubtitle {
    return Intl.message(
      'Remember that with your active Doctors Net membership, you will be guaranteed the following benefits:',
      name: 'membershipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get membershipMonthly {
    return Intl.message(
      'Monthly',
      name: 'membershipMonthly',
      desc: '',
      args: [],
    );
  }

  /// `Annual`
  String get membershipAnnual {
    return Intl.message(
      'Annual',
      name: 'membershipAnnual',
      desc: '',
      args: [],
    );
  }

  /// `Benefits`
  String get membershipBenefits {
    return Intl.message(
      'Benefits',
      name: 'membershipBenefits',
      desc: '',
      args: [],
    );
  }

  /// `see more`
  String get membershipSeemore {
    return Intl.message(
      'see more',
      name: 'membershipSeemore',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get membershipSkip {
    return Intl.message(
      'Skip',
      name: 'membershipSkip',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get membershipSubscribe {
    return Intl.message(
      'Subscribe',
      name: 'membershipSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `with Card/SPEI`
  String get membershipWithSpei {
    return Intl.message(
      'with Card/SPEI',
      name: 'membershipWithSpei',
      desc: '',
      args: [],
    );
  }

  /// `with crypto`
  String get membershipWithCripto {
    return Intl.message(
      'with crypto',
      name: 'membershipWithCripto',
      desc: '',
      args: [],
    );
  }

  /// `We are loading data...`
  String get membershipWithLoading {
    return Intl.message(
      'We are loading data...',
      name: 'membershipWithLoading',
      desc: '',
      args: [],
    );
  }

  /// `Cancel subscription`
  String get membershipModalCancelTitle {
    return Intl.message(
      'Cancel subscription',
      name: 'membershipModalCancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to cancel your subscription to the (Name) Doctors Net membership? Remember that you can enjoy the benefits until:`
  String get membershipModalCancelsubTitle {
    return Intl.message(
      'Do you want to cancel your subscription to the (Name) Doctors Net membership? Remember that you can enjoy the benefits until:',
      name: 'membershipModalCancelsubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment Check`
  String get modalCheckingMembershipTitle {
    return Intl.message(
      'Payment Check',
      name: 'modalCheckingMembershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next check the selected plan and the amount to pay to enjoy all the benefits.`
  String get modalCheckingMembershipSubtitle {
    return Intl.message(
      'Next check the selected plan and the amount to pay to enjoy all the benefits.',
      name: 'modalCheckingMembershipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get modalCheckoutMembershipTitle {
    return Intl.message(
      'Check',
      name: 'modalCheckoutMembershipTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next check the selected plan and the amount to pay to enjoy all the benefits.`
  String get modalCheckoutMembershipSubtitle {
    return Intl.message(
      'Next check the selected plan and the amount to pay to enjoy all the benefits.',
      name: 'modalCheckoutMembershipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment Option`
  String get modalCheckoutMembershipOptionPayment {
    return Intl.message(
      'Payment Option',
      name: 'modalCheckoutMembershipOptionPayment',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get modalCheckoutMembershipChange {
    return Intl.message(
      'Change',
      name: 'modalCheckoutMembershipChange',
      desc: '',
      args: [],
    );
  }

  /// `Payment Detail`
  String get modalCheckoutMembershipDetailPayment {
    return Intl.message(
      'Payment Detail',
      name: 'modalCheckoutMembershipDetailPayment',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get modalCheckoutMembershipTotal {
    return Intl.message(
      'Total:',
      name: 'modalCheckoutMembershipTotal',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get modalCheckoutMembershipLabelButton {
    return Intl.message(
      'Checkout',
      name: 'modalCheckoutMembershipLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `Processing your payment, please wait...`
  String get modalCheckoutMembershipLoading {
    return Intl.message(
      'Processing your payment, please wait...',
      name: 'modalCheckoutMembershipLoading',
      desc: '',
      args: [],
    );
  }

  /// `Payment successful`
  String get modalConfirmationPaymentMembershipTitleSuccess {
    return Intl.message(
      'Payment successful',
      name: 'modalConfirmationPaymentMembershipTitleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Transaction failed`
  String get modalConfirmationPaymentMembershipTitleFailed {
    return Intl.message(
      'Transaction failed',
      name: 'modalConfirmationPaymentMembershipTitleFailed',
      desc: '',
      args: [],
    );
  }

  /// `Details: `
  String get modalConfirmationPaymentMembershipDetails {
    return Intl.message(
      'Details: ',
      name: 'modalConfirmationPaymentMembershipDetails',
      desc: '',
      args: [],
    );
  }

  /// `Receipt number: `
  String get modalConfirmationPaymentMembershipNumber {
    return Intl.message(
      'Receipt number: ',
      name: 'modalConfirmationPaymentMembershipNumber',
      desc: '',
      args: [],
    );
  }

  /// `Payment Detail`
  String get modalConfirmationPaymentMembershipDetailPayment {
    return Intl.message(
      'Payment Detail',
      name: 'modalConfirmationPaymentMembershipDetailPayment',
      desc: '',
      args: [],
    );
  }

  /// `Concept`
  String get modalConfirmationPaymentMembershipConcept {
    return Intl.message(
      'Concept',
      name: 'modalConfirmationPaymentMembershipConcept',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get modalConfirmationPaymentMembershipPaymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'modalConfirmationPaymentMembershipPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Back to top`
  String get modalConfirmationPaymentMembershipButtonSuccess {
    return Intl.message(
      'Back to top',
      name: 'modalConfirmationPaymentMembershipButtonSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get modalConfirmationPaymentMembershipButtonFailed {
    return Intl.message(
      'Retry',
      name: 'modalConfirmationPaymentMembershipButtonFailed',
      desc: '',
      args: [],
    );
  }

  /// `Yearly Membership`
  String get modalConfirmationPaymentMembershipConceptYearly {
    return Intl.message(
      'Yearly Membership',
      name: 'modalConfirmationPaymentMembershipConceptYearly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly membership`
  String get modalConfirmationPaymentMembershipConceptMonthly {
    return Intl.message(
      'Monthly membership',
      name: 'modalConfirmationPaymentMembershipConceptMonthly',
      desc: '',
      args: [],
    );
  }

  /// `Bank transfer`
  String get PaymentWithSpeiTitle {
    return Intl.message(
      'Bank transfer',
      name: 'PaymentWithSpeiTitle',
      desc: '',
      args: [],
    );
  }

  /// `Then verify the information provided to make the payment via Spei bank transfer.`
  String get PaymentWithSpeiSubtitle {
    return Intl.message(
      'Then verify the information provided to make the payment via Spei bank transfer.',
      name: 'PaymentWithSpeiSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get paymentWithSpeiAmount {
    return Intl.message(
      'Amount',
      name: 'paymentWithSpeiAmount',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get paymentWithSpeiDate {
    return Intl.message(
      'Date',
      name: 'paymentWithSpeiDate',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get paymentWithSpeiBank {
    return Intl.message(
      'Bank',
      name: 'paymentWithSpeiBank',
      desc: '',
      args: [],
    );
  }

  /// `Clabe`
  String get paymentWithSpeiClabe {
    return Intl.message(
      'Clabe',
      name: 'paymentWithSpeiClabe',
      desc: '',
      args: [],
    );
  }

  /// `Expiration time:`
  String get paymentWithSpeiDateExpiration {
    return Intl.message(
      'Expiration time:',
      name: 'paymentWithSpeiDateExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Confirm payment`
  String get paymentWithSpeiLabelButton {
    return Intl.message(
      'Confirm payment',
      name: 'paymentWithSpeiLabelButton',
      desc: '',
      args: [],
    );
  }

  /// `Without data`
  String get paymentWithSpeiWithoutData {
    return Intl.message(
      'Without data',
      name: 'paymentWithSpeiWithoutData',
      desc: '',
      args: [],
    );
  }

  /// `Loading payment information...`
  String get paymentWithSpeiLoading {
    return Intl.message(
      'Loading payment information...',
      name: 'paymentWithSpeiLoading',
      desc: '',
      args: [],
    );
  }

  /// `We are processing the payment`
  String get paymentWithSpeiModalTitle {
    return Intl.message(
      'We are processing the payment',
      name: 'paymentWithSpeiModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your payment is still in the confirmation process, please wait a moment to confirm again.`
  String get paymentWithSpeiModalSubtitle {
    return Intl.message(
      'Your payment is still in the confirmation process, please wait a moment to confirm again.',
      name: 'paymentWithSpeiModalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `The field is required`
  String get validationObligatoryField {
    return Intl.message(
      'The field is required',
      name: 'validationObligatoryField',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name`
  String get validationname {
    return Intl.message(
      'Invalid name',
      name: 'validationname',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid name without special characters or accents`
  String get validationCardName {
    return Intl.message(
      'Enter a valid name without special characters or accents',
      name: 'validationCardName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format (MM/YY)`
  String get validationFormatDate {
    return Intl.message(
      'Invalid format (MM/YY)',
      name: 'validationFormatDate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid month.`
  String get validationFormatDateMounthly {
    return Intl.message(
      'Invalid month.',
      name: 'validationFormatDateMounthly',
      desc: '',
      args: [],
    );
  }

  /// `Invalid year.`
  String get validationFormatDateYearly {
    return Intl.message(
      'Invalid year.',
      name: 'validationFormatDateYearly',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get validationFormatDate2 {
    return Intl.message(
      'Invalid date',
      name: 'validationFormatDate2',
      desc: '',
      args: [],
    );
  }

  /// `The card number must only contain digits`
  String get validationFormatCardNumber {
    return Intl.message(
      'The card number must only contain digits',
      name: 'validationFormatCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid card number`
  String get validationFormatCardNumberField {
    return Intl.message(
      'Invalid card number',
      name: 'validationFormatCardNumberField',
      desc: '',
      args: [],
    );
  }

  /// `The CVV number must only contain digits`
  String get validationFormatCvvNumber {
    return Intl.message(
      'The CVV number must only contain digits',
      name: 'validationFormatCvvNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid CVV number`
  String get validationFormatCvvNumberField {
    return Intl.message(
      'Invalid CVV number',
      name: 'validationFormatCvvNumberField',
      desc: '',
      args: [],
    );
  }

  /// `Available dates`
  String get calendarPickerTitle {
    return Intl.message(
      'Available dates',
      name: 'calendarPickerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select the available date from the calendar that best suits your needs.`
  String get calendarPickerSubtitle {
    return Intl.message(
      'Select the available date from the calendar that best suits your needs.',
      name: 'calendarPickerSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get dropdownNoDta {
    return Intl.message(
      'No data',
      name: 'dropdownNoDta',
      desc: '',
      args: [],
    );
  }

  /// `Confirm schedule`
  String get modalConfirmScheduleTitle {
    return Intl.message(
      'Confirm schedule',
      name: 'modalConfirmScheduleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the appointment time from the time available by the doctor`
  String get modalConfirmScheduleSubtitle {
    return Intl.message(
      'Confirm the appointment time from the time available by the doctor',
      name: 'modalConfirmScheduleSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reason for consultation`
  String get modalReasonForConsultationTitle {
    return Intl.message(
      'Reason for consultation',
      name: 'modalReasonForConsultationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the reason or symptoms to process your doctor's appointment:`
  String get modalReasonForConsultationSubtitle {
    return Intl.message(
      'Enter the reason or symptoms to process your doctor\'s appointment:',
      name: 'modalReasonForConsultationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get modalReasonForConsultationInputTitle {
    return Intl.message(
      'Reason',
      name: 'modalReasonForConsultationInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Describes the reason for the query`
  String get modalReasonForConsultationInputHintext {
    return Intl.message(
      'Describes the reason for the query',
      name: 'modalReasonForConsultationInputHintext',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled appointment`
  String get modalScheduledAppointmentSuccess {
    return Intl.message(
      'Scheduled appointment',
      name: 'modalScheduledAppointmentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Appointment not scheduled`
  String get modalScheduledAppointmentFailed {
    return Intl.message(
      'Appointment not scheduled',
      name: 'modalScheduledAppointmentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your doctor's appointment: `
  String get modalScheduledAppointmentSubtitle {
    return Intl.message(
      'Your doctor\'s appointment: ',
      name: 'modalScheduledAppointmentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `has been successfully scheduled, remember to keep an eye on your calendar and notifications.`
  String get modalScheduledAppointmentSubtitle2 {
    return Intl.message(
      'has been successfully scheduled, remember to keep an eye on your calendar and notifications.',
      name: 'modalScheduledAppointmentSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we were unable to schedule your appointment, we invite you to try again with another date, or with other available doctors.`
  String get modalScheduledAppointmentSubtitle3 {
    return Intl.message(
      'Sorry, we were unable to schedule your appointment, we invite you to try again with another date, or with other available doctors.',
      name: 'modalScheduledAppointmentSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get modalScheduledAppointmentDate {
    return Intl.message(
      'Date',
      name: 'modalScheduledAppointmentDate',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get modalScheduledAppointmentClock {
    return Intl.message(
      'Time',
      name: 'modalScheduledAppointmentClock',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get modalScheduledAppointmentReason {
    return Intl.message(
      'Reason',
      name: 'modalScheduledAppointmentReason',
      desc: '',
      args: [],
    );
  }

  /// `Modality`
  String get modalScheduledAppointmentModality {
    return Intl.message(
      'Modality',
      name: 'modalScheduledAppointmentModality',
      desc: '',
      args: [],
    );
  }

  /// `Video consultation`
  String get modalScheduledAppointmentVideo {
    return Intl.message(
      'Video consultation',
      name: 'modalScheduledAppointmentVideo',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Next appointments`
  String get nextAppointments {
    return Intl.message(
      'Next appointments',
      name: 'nextAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Treatments`
  String get treatments {
    return Intl.message(
      'Treatments',
      name: 'treatments',
      desc: '',
      args: [],
    );
  }

  /// `Past appointments`
  String get pastAppointments {
    return Intl.message(
      'Past appointments',
      name: 'pastAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Live chat`
  String get liveChat {
    return Intl.message(
      'Live chat',
      name: 'liveChat',
      desc: '',
      args: [],
    );
  }

  /// `Video inquiry`
  String get videoInquiry {
    return Intl.message(
      'Video inquiry',
      name: 'videoInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Antibiotic treatment`
  String get antibioticTreatment {
    return Intl.message(
      'Antibiotic treatment',
      name: 'antibioticTreatment',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get locale {
    return Intl.message(
      'en',
      name: 'locale',
      desc: '',
      args: [],
    );
  }

  /// `View chat`
  String get viewChat {
    return Intl.message(
      'View chat',
      name: 'viewChat',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Full dose`
  String get fullDose {
    return Intl.message(
      'Full dose',
      name: 'fullDose',
      desc: '',
      args: [],
    );
  }

  /// `Add to another calendar`
  String get addToAnotherCalendar {
    return Intl.message(
      'Add to another calendar',
      name: 'addToAnotherCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Participants`
  String get participants {
    return Intl.message(
      'Participants',
      name: 'participants',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message(
      'Files',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `View more`
  String get viewMore {
    return Intl.message(
      'View more',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Drugs`
  String get drugs {
    return Intl.message(
      'Drugs',
      name: 'drugs',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get from {
    return Intl.message(
      'From: ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get to {
    return Intl.message(
      'To: ',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `In this treatment`
  String get thisTreatment {
    return Intl.message(
      'In this treatment',
      name: 'thisTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Repeat inquiry`
  String get repeatInquiry {
    return Intl.message(
      'Repeat inquiry',
      name: 'repeatInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Repeating an appointment is subject to the availability of the doctor, even if you wish to continue?`
  String get messageRepeatInquiry {
    return Intl.message(
      'Repeating an appointment is subject to the availability of the doctor, even if you wish to continue?',
      name: 'messageRepeatInquiry',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule consultation`
  String get rescheduleConsultation {
    return Intl.message(
      'Reschedule consultation',
      name: 'rescheduleConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Remember your appointment is in 2 days, do you still wish to continue? Rescheduling will be subject to the doctor's availability.`
  String get messageRescheduleConsultation {
    return Intl.message(
      'Remember your appointment is in 2 days, do you still wish to continue? Rescheduling will be subject to the doctor\'s availability.',
      name: 'messageRescheduleConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel request`
  String get cancelRequest {
    return Intl.message(
      'Cancel request',
      name: 'cancelRequest',
      desc: '',
      args: [],
    );
  }

  /// `Remember that your appointment is in 2 days, if you cancel the consultation you will not be able to get it back, even so. do you want to continue?`
  String get messageCancelRequest {
    return Intl.message(
      'Remember that your appointment is in 2 days, if you cancel the consultation you will not be able to get it back, even so. do you want to continue?',
      name: 'messageCancelRequest',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
