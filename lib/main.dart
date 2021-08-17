import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Input App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool detailsSubmitted = false;
  bool loading = false;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final schoolName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('Jeremiah Oluwaseun ERINOLA');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Simple Input'),
      ),
      body: detailsSubmitted
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Hi!, Your name is ${firstName.text} ${lastName.text}. \nYou are a student of ${schoolName.text}. \nCongratulations! You\'re in! 👏👏',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            detailsSubmitted = false;
                            loading = false;
                          });
                        },
                        child: Text('Add another Student!'))
                  ]),
            )
          : loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Fill your information to register your presence',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: firstName,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          // validator: (value) {
                          //   return value == null ? 'Please enter your first name' : '';
                          // },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                              hintText: 'eg. Seun'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: lastName,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                              hintText: 'eg. Ayo'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: schoolName,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'School Name',
                              hintText: 'eg. UNILAG'),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (firstName.text.isNotEmpty &&
                                lastName.text.isNotEmpty &&
                                schoolName.text.isNotEmpty) {
                              setState(() {
                                loading = true;
                              });
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  detailsSubmitted = true;
                                  loading = false;
                                });
                              }).whenComplete(() => setState(() => !loading));
                            }
                          },
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
