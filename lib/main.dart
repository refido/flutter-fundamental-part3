import 'package:flutter/material.dart';
// import 'widget/image_widget.dart';
// import 'widget/forms.dart';
import 'widget/input_fields.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController.fromValue(
      const TextEditingValue(text: "isi angka saja"));

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
            // onTap: _incrementCounter,
            // onDoubleTap: _incrementCounter,
            onLongPress: _incrementCounter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const ImageWidget(),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                // const FormContoh(),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      VerificationCodeFormField(controller: _controller),
                      Builder(
                        builder: (BuildContext subContext) => ElevatedButton(
                          onPressed: () {
                            final valid = Form.of(subContext)!.validate();
                            if (valid) {
                              print("valid: $valid");
                            }
                          },
                          child: const Text("validate"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
