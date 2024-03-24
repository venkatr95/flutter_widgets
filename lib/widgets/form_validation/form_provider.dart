import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/widgets/form_validation/validation_model.dart';
import 'package:flutter_widgets/widgets/general_screens/success_screen.dart';
import 'package:provider/provider.dart';

import 'custom_field.dart';

class ProviderFormPage extends StatefulWidget {
  const ProviderFormPage({super.key});

  @override
  ProviderFormPageState createState() => ProviderFormPageState();
}

class ProviderFormPageState extends State<ProviderFormPage> {
  final _formKey = GlobalKey<FormState>();
  late FormProvider _formProvider;

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<FormProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Name',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                onChanged: _formProvider.validateName,
                errorText: _formProvider.name.error,
              ),
              CustomFormField(
                hintText: 'Email',
                onChanged: _formProvider.validateEmail,
                errorText: _formProvider.email.error,
              ),
              CustomFormField(
                hintText: 'Phone',
                onChanged: _formProvider.validatePhone,
                errorText: _formProvider.phone.error,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
              ),
              CustomFormField(
                hintText: 'Password',
                onChanged: _formProvider.validatePassword,
                errorText: _formProvider.password.error,
              ),
              Consumer<FormProvider>(builder: (context, model, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (model.validate) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SuccessScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
