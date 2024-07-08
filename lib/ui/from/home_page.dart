import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:norah/Repo/validator/inputextflied/validators.dart';
import 'package:norah/custom%20_wiget/form_input_field/form_input_field.dart';

import '../../service/Controller/from_controller/form_controller.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>(); ///this global for Validators

  /// this are all TextEditingControllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FormController().submitForm(
          name: _nameController.text,
          email: _emailController.text,
          mobile: _mobileController.text,
          address: _addressController.text,
          context: context,
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildFormField(
                        controller: _nameController,
                        hint: "Name",
                        validator: Validators.nameValidator,
                      ),
                      _buildFormField(
                        controller: _emailController,
                        hint: "Email",
                        validator: Validators.emailValidator,
                      ),
                      _buildFormField(
                        controller: _mobileController,
                        hint: "Mobile Number",
                        validator: Validators.mobileValidator,
                      ),
                      _buildFormField(
                        controller: _addressController,
                        hint: "Address",
                        validator: Validators.addressValidator,
                      ),
                      SizedBox(height: 30),
                      _isLoading
                          ? CircularProgressIndicator()
                          : _buildSubmitButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///  this background images & animations
  Widget _buildHeader() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeInUp(
              duration: Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/light-1.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeInUp(
              duration: Duration(milliseconds: 1200),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/light-2.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeInUp(
              duration: Duration(milliseconds: 1300),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/clock.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: FadeInUp(
              duration: Duration(milliseconds: 1600),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Form",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// animation duration
  Widget _buildFormField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return FadeInUp(
      duration: Duration(milliseconds: 1800),
      child: FormInputField(
        controller: controller,
        hint: hint,
        validator: validator,
      ),
    );
  }

  /// submit button with local validate
  Widget _buildSubmitButton(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 1900),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ],
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () => _submitForm(context),
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
