import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'User Screen Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();

  String dropdownValue = 'Male';
  String bloodGroupValue = 'A+';

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Emergency Contact Number',
      ),
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value != '0' ||
            value != '1' ||
            value != '2' ||
            value != '3' ||
            value != '4' ||
            value != '5' ||
            value != '6' ||
            value != '7' ||
            value != '8' ||
            value != '9') {
          return 'Contact Number can not be blank or is invalid';
        }
        return null;
      },
    );
    return Scaffold(
      appBar: AppBar(
          title: Text("Tell us about yourself."),
          backgroundColor: Colors.orangeAccent),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First name can not be blank';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last name can not be blank';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Date of Birth',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Date of birth can not be blank';
                  }
                  return null;
                },
              ),
              DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_circle),
                iconSize: 20,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Emergency Contact Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact Number can not be blank';
                  }
                  return null;
                },
              ),
              textFormField,
              DropdownButton(
                value: bloodGroupValue,
                icon: const Icon(Icons.arrow_drop_down_circle),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(
                  color: Colors.deepPurple,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    bloodGroupValue = newValue!;
                  });
                },
                items: <String>[
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Create Profile'),
              ),
            ],
          ),
        ),

        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       'First Name:',
        //     ),
        //     // Text(
        //     //   '$_counter',
        //     //   style: Theme.of(context).textTheme.headline4,
        //     // ),
        //     TextField(
        //       decoration: InputDecoration(
        //           border: OutlineInputBorder(),
        //           hintText: 'Enter your first name here'),
        //     ),
        //     Text(
        //       'Last Name:',
        //     ),
        //     // Text(
        //     //   '$_counter',
        //     //   style: Theme.of(context).textTheme.headline4,
        //     // ),
        //     TextField(
        //       decoration: InputDecoration(
        //           border: OutlineInputBorder(),
        //           hintText: 'Enter your last name here'),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
