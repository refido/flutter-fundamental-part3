import 'package:flutter/material.dart';

class FormContoh extends StatefulWidget {
  const FormContoh({Key? key}) : super(key: key);

  @override
  FormContohState createState() => FormContohState();
}

class FormContohState extends State<FormContoh> {
  final _controller = TextEditingController.fromValue(
    const TextEditingValue(text: "Initial value"),
  );

  final _key = GlobalKey<FormFieldState<String>>();
  String _textValue = "";

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _textValue = _controller.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Teks :',
          ),
          Text(
            _textValue,
            style: Theme.of(context).textTheme.headline3,
          ),
          TextFormField(
            controller: _controller,
            validator: (String? value) {
              return value == null || value.isEmpty
                  ? "Tidak Boleh Kosong"
                  : null;
            },
          ),
          TextFormField(),
          Builder(
            builder: (BuildContext subContext) => TextButton(
              onPressed: () {
                final valid = Form.of(subContext)!.validate();
                if (valid) {
                  print("valid: $valid");
                }
                if (valid) {
                  setState(() {
                    _textValue = _controller.text;
                  });
                }
              },
              child: const Text("validate"),
            ),
          )
        ],
      ),
    );
  }
}
