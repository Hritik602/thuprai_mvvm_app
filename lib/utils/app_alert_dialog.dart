import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

ProgressDialog? progressDialog;

showLoadingIndicator(BuildContext context) {
  progressDialog = ProgressDialog(context,
      blur: 5,
      dismissable: false,
      title: const Text(""),
      message: const Text("Please wait"),
      onDismiss: () {});
  progressDialog?.show();
}

dismissLoadingIndicator() {
  progressDialog?.dismiss();
}

showSuccessAlertDialog(BuildContext context) {
  CoolAlert.show(
    context: context,
    barrierDismissible: false,
    type: CoolAlertType.success,
    text: "",
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
    onConfirmBtnTap: () {},
    // autoCloseDuration: const Duration(seconds: 2),
  );
}

showErrorAlertDialog(BuildContext context,
    {Function()? onConfirmBtnTap, String? message}) {
  CoolAlert.show(
    context: context,
    barrierDismissible: false,
    type: CoolAlertType.error,
    text: message ?? 'Error occurred',
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
    onConfirmBtnTap: () {},
    // autoCloseDuration: const Duration(seconds: 2),
  );
}

loadingIndicator(BuildContext context) {
  CoolAlert.show(context: context, type: CoolAlertType.loading);
}
