import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../network/local/cache_helper.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  bool isUpperCase = true,
  double radius = 0,
  required String text,
}) =>
    Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );

Widget defaultTextButtom({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onsubmitted,
  Function? onchanged,
  Function? onTap,
  required validate,
  required String labeltext,
  required IconData prefex,
  IconData? suffix,
  bool ispassword = false,
  Function? suffixpressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        onsubmitted!(s);
      },
      onChanged: (s) {
        onchanged!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: validate,
      decoration: InputDecoration(
          labelText: labeltext,
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            prefex,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixpressed!();
                  },
                  icon: Icon(suffix))
              : null),
      obscureText: ispassword,
    );

Widget defaultAppbar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new)),
      title: Text('add post'),
    );

Widget MyDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

void ShowToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WAERNING }

Color ChooseToastColor(ToastState state) {
  Color color;

  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WAERNING:
      color = Colors.amber;
      break;
  }
  return color;
}
