import 'package:custom_styles_package/custom_styles_package.dart';
import 'package:custom_styles_package/theme/custom_text_styles.dart';
import 'package:custom_styles_package/theme/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validators_and_input_formatters/validators/validators.dart';

void main() {
  runApp(
    ScreenUtilInit(designSize: const Size(390, 850), child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    CustomStylesConfig.init(
      primary: Colors.orangeAccent,
      initializeCustomTextSyle: false,
    );
    CustomTextStyle.init(
      headingLargeStyle: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                vSizedBox8,
                vSizedBox4,
                CustomText.headingLarge('Login'),
                vSizedBox2,
                CustomTextField(
                  controller: emailController,
                  hintText: 'Type here..',
                  headingText: 'Email',
                  validator: (val) => CustomValidators.emailValidation(val),
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Type here..',
                  headingText: 'Password',
                  validator: (val) => CustomValidators.passwordValidation(val),
                ),
                vSizedBox2,

                CustomButton(
                  text: 'Submit',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Submit Successful!!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
