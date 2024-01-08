// import 'package:ecom/sign_in_via_phone.dart';
import 'package:ecom/screens/auth_screen/sign_in_via_email.dart';
import 'package:ecom/screens/auth_screen/sign_in_via_phone.dart';
import 'package:flutter/material.dart';
// import 'package:ecom/sign_in_via_email.dart';

class SignInTabView extends StatefulWidget {
  const SignInTabView({super.key});

  @override
  State<SignInTabView> createState() => _SignInTabViewState();
}

class _SignInTabViewState extends State<SignInTabView> {
  final List<Widget> _tabs = [
    const SignInEmail(),
    const SignInPhone()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Welcome To ECOM',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15.0),
              DefaultTabController(
                length: _tabs.length,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                      child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TabBar(
                              labelColor: Colors.white, // Change selected tab label color
                              // indicatorColor: Colors.red, // Change indicator color
                              indicatorWeight: 4.0,
                              indicatorSize: TabBarIndicatorSize.tab,
                              unselectedLabelColor: Colors.black,
                              indicator: BoxDecoration(
                                  color: Colors.blueAccent, // Change selected tab background color
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueAccent, width: 1.0)
                              ),
                              tabs: const [
                                Tab(
                                  text: 'Email',
                                ),
                                Tab(
                                  text: 'Phone',
                                ),
                              ]
                          )),
                    ),
                    SizedBox(
                      height: 500.0,
                      child: TabBarView(children: _tabs),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
