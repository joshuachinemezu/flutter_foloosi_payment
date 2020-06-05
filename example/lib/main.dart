import 'package:flutter/material.dart';
import 'package:foloosi_payment/foloosi_payment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foloosi Payment Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool proceedToPayment = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _proceeedToPayment() {
    setState(() {
      proceedToPayment = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: proceedToPayment
          ? null
          : AppBar(
              title: Text('Foloosi Payment Flutter'),
            ),
      body: proceedToPayment
          ? FoloosiPayment(
              headerText: "Foloosi Payment",
              successRoute: '/OrderSuccess',
              successRouteParam: 'Foloosi',
              loaderText: "Processing Request",
              merchantKey: 'YOUR_MERCHANT_KEY',
              secretKey: 'YOUR_SECRET_KEY',
              transactionAmount: 2000,
              currency: 'AED',
              customerName: 'Joshua Chinemezu',
              customerEmail: 'joshuachinemezu@gmail.com',
              customerMobile: '+971500000000',
              onError: (value) {
                print("Payment Error : $value");
                setState(() {
                  proceedToPayment = false;
                });
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(value.toString()),
                  duration: Duration(seconds: 3),
                ));
              },
              onSuccess: (value) {
                print("Payment Success : $value");
                setState(() {
                  proceedToPayment = false;
                });
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(value.toString()),
                  duration: Duration(seconds: 3),
                ));
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _proceeedToPayment,
                    child: new Text(
                      "Proceed to Payment",
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
