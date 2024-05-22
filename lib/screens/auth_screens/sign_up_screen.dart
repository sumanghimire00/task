import 'package:flutter/material.dart';
import 'package:task/customs_widget/custom_button.dart';
import 'package:task/customs_widget/custom_textform_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/register.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // First Semi-transparent overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(
                0.95,
              ),
            ),
          ),

          // Scrollable content
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                  horizontal: width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: height * 0.02,
                        right: width * 1.2,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: width * 0.08,
                        ),
                      ),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.036,
                        color: Colors.white,
                      ),
                    ),
                    // Text Container
                    _textContainer(),
                    // Your details Widget
                    _yourDetailsWidget(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    //  Password Widget
                    _passwordWidget(),
                    SizedBox(
                      height: height * 0.080,
                    ),
                    //  Register Button
                    CustomButton(
                      labelButton: "Register",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textContainer() {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "If you already have an account register",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: [
              const Text(
                "You can",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Login here !",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _yourDetailsWidget() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Details",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        // Activation code Field
        const Text(
          "Enter activation code",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),

        const InputTextField(
          hintText: "Enter Code",
          prefixicon: Icons.lock_open,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        // Email Text form field
        const Text(
          "Email",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),

        const InputTextField(
          hintText: "Enter your Email",
          prefixicon: Icons.lock_open,
        ),
      ],
    );
  }

  Widget _passwordWidget() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        // Password field
        const Text(
          "Password",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),

        const InputTextField(
          type: TextFieldType.Password,
          hintText: "Enter your password",
          prefixicon: Icons.lock_open,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        // Confirm password field
        const Text(
          "Confirm Password",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        const InputTextField(
          type: TextFieldType.Password,
          hintText: "Confirm your Password",
          prefixicon: Icons.lock_open,
        ),
      ],
    );
  }
}
