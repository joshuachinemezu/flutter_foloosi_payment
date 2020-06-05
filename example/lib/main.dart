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
      home: MyHomePage(title: 'Foloosi Payment Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool proceedToPayment = false;

  void _proceeedToPayment() {
    setState(() {
      proceedToPayment = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return proceedToPayment
        ? FoloosiPayment(
            headerText: "Supermarket Payment",
            successRoute: '/OrderSuccess',
            successRouteParam: 'Foloosi',
            loaderText: "Processing Request",
            merchantKey: 'YOUR_MERCHANT_KEY',
            secretKey: 'YOUR_SECRET_KEY',
            transactionAmount: 2000,
            currency: 'AED',
            customerName: 'Joshua Chinemezu',
            customerEmail: 'joshuachinemezu@gmail.com',
            customerMobile: '+971545226635',
            onError: (value) {
              print("VALUE : $value");
              setState(() {
                proceedToPayment = false;
              });
            },
      onSuccess: (value) {
        print("VALUE : $value");
        setState(() {
          proceedToPayment = false;
        });
      },
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
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
