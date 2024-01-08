import 'package:ecom/consts/consts.dart';

Widget inputTextField(
    {required TextEditingController controller,
      required String labelText,
      required IconData icon,
    required Color? color,
      required TextInputType inputType}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
        ),
      floatingLabelStyle: TextStyle(
        color: color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color!, width: 2.0),
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
      ),
    ),
    keyboardType: inputType,
  );
}

Widget inputText(
    {required TextEditingController controller,
      required bool obsecureText,
      required String labelText,
      required String? Function(String?)? validator,
      required Color? color}) {
  return TextFormField(
    controller: controller,
    obscureText: obsecureText,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
      ),
      floatingLabelStyle: TextStyle(
          color: color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color!, width: 2.0),
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
      ),
    ),
    validator: validator,
  );
}

Widget inputPasswordField(
    {required TextEditingController? controller,
      required String? labelText,
    required bool obsecureText,
    required Color? color,
    required VoidCallback onPressedCallback}) {
  return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
          labelText: labelText,
        suffixIcon: IconButton(
          onPressed: onPressedCallback,
          icon: Icon(
            obsecureText
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
        floatingLabelStyle: TextStyle(
            color: color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color!, width: 2.0),
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
        ),
      )
  );
}
