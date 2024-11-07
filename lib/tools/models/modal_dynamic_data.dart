import 'package:flutter/material.dart';

class ModalDinamicData {
  bool? isSuccess;
  String? pathImage;
  String? title;
  String? subtitle;
  Color? colorButton;

  String? labelButton;
  Function? onPressed;
  Function? onPressedNo;
  Function? onPressedYes;
  String? labelButtonYes;
  String? labelButtonNo;
  double? widthButtonNo;
  double? widthButtonYes;
  Color? colorButtonNo;
  Color? colorButtonYes;

  ModalDinamicData({
    this.isSuccess = false,
    this.pathImage,
    this.title,
    this.subtitle,
    this.colorButton,
    this.labelButton,
    this.onPressed,
    this.onPressedNo,
    this.onPressedYes,
    this.labelButtonYes,
    this.labelButtonNo,
    this.widthButtonNo,
    this.widthButtonYes,
    this.colorButtonNo,
    this.colorButtonYes,
  });
}
