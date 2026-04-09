import 'package:flutter/material.dart';

// sizedbox(height: 20) => 20.heightBox 처럼 쓸 수 있음
extension SizedBoxExtension on num {
  Widget get widthBox => SizedBox(width: toDouble());
  Widget get heightBox => SizedBox(height: toDouble());
}