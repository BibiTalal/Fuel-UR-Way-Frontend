import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/style/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

class PrimaryBoldText extends Text {
  PrimaryBoldText({
    Key? key,
    required BuildContext context,
    required String data,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: drawerBackgroundColor,
            fontWeight: FontWeight.bold,
          ),
        );
}

class PrimaryIcon extends Icon {
  PrimaryIcon({
    Key? key,
    required IconData icon,
    required BuildContext context,
  }) : super(icon, key: key, color: drawerBackgroundColor);
}

class CarName extends Text {
  const CarName({Key? key, required String data})
      : super(
          data,
          key: key,
          maxLines: 2,
          textAlign: TextAlign.center,
        );
}

Widget defaultButton({
  double? width = double.infinity, //common use
  Color? background = Colors.blue,
  bool? isuUpperCase = true,
  required Function() function,
  required String text,
  double? radius = 10.0,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: background,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isuUpperCase! ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.white),
          ),
        ));

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  bool? obscureText,
  Function(String)? Submitted,
  Function(String?)? onChanged,
  FormFieldValidator? valdaitefun,
  bool isPassword = false,
  String? labelText,
  String? hintText,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPress,
  Function()? onTap,
  bool? isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      obscureText: isPassword,
      onFieldSubmitted: Submitted,
      onChanged: onChanged,
      validator: valdaitefun,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPress, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        // AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  //AppCubit.get(context).updateData(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
              onPressed: () {
                // AppCubit.get(context).updateData(status: 'archive', id: model['id']);
              },
              icon: Icon(Icons.archive),
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
