import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

ProgressDialog? progressDialog;

showLoadingIndicator(BuildContext context) {
  progressDialog = ProgressDialog(context,
      blur: 10,
      dismissable: false,
      title: const Text(""),
      message: const Text("Please wait"),
      onDismiss: () {});
  progressDialog?.show();
}

dismissLoadingIndicator() {
  progressDialog?.dismiss();
}

showSuccessNAlertDialog(BuildContext context) {
  NDialog(
    dialogStyle: DialogStyle(titleDivider: true),
    title: Text("NDialog"),
    content: Text("This is NDialog's content"),
    actions: <Widget>[
      TextButton(child: Text("Okay"), onPressed: () => Navigator.pop(context)),
      TextButton(child: Text("Close"), onPressed: () => Navigator.pop(context)),
    ],
  ).show(context);
}

showSuccessAlertDialog(BuildContext context, Function()? onConfirmBtnTap) {
  CoolAlert.show(
    context: context,

    type: CoolAlertType.error,
    text: 'Transaction completed successfully!',
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
