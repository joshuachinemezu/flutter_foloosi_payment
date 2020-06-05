# foloosi_payment

[![pub package](https://img.shields.io/pub/v/foloosi_payment.svg)](https://pub.dartlang.org/packages/foloosi_payment)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/Joshuachinemezu@gmail.com)

A Flutter plugin for making payments via Foloosi Payment Gateway. Fully supports Android and iOS.

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="" width="400" />
            </td>
        </tr>
    </table>
</div>

## 💻 Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
foloosi_payment: 0.0.1
```

Import in your project:
```dart
import 'package:foloosi_payment/foloosi_payment.dart';
```

## ❔Basic Usage
```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

bool proceedToPayment = false;

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
              headerText: 'Foloosi Payment',
              successRoute: '/OrderSuccess',
              successRouteParam: 'Foloosi',
              loaderText: "Processing Request",
              merchantKey: 'YOUR_FOLOOSI_MERCHANT_KEY',
              secretKey: 'YOUR_FOLOOSI_SECRET_KEY',
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
```

## Properties

Here is a list of properties available:

|        Name        	    |       Type      |     Required	    |                 Description                	              |
|:------------------:	    |:---------------:|	:---------------: |:---------------------------------------------------------:|
| headerText         	    | String          |	    false         | the title of the widget's appbar           	              |
| successRoute       	    | String          |	    true          | the app route to redirect the user on success             |
| successRouteParam       | any             |     false         | the param(s) to pass to the success route                 |
| onError           	    | Function        |	    true          | function to run on payment error              	          |
| onSuccess         	    | Function        |	    true          | function to run on payment success            	          |
| loaderText         	    | String          |	    false         | text to display under the loader               	          |
| merchantKey             | String          |	    true          | your foloosi merchant key                      	          |
| secretKey               | String          |	    true          | your foloosi secret key                       	          |
| referenceToken          | String          |	    false         | the reference token - generates automatically if null     |
| redirectUrl             | String          |	    false         | the redirect url                                          |
| transactionAmount       | String          |	      -           | transaction amount - required if referenceToken is null   |
| currency                | String          |	      -           | transaction currency - required if referenceToken is null |
| customerName            | String          |	    false         | customer name - auto render in payment popup if passed    |
| customerEmail           | String          |	    false         | customer email - auto render in payment popup if passed   |
| customerMobile          | String          |	    false         | customer mobile - auto render in payment popup if passed  |
| customerAddress         | String          |	    false         | customer address - auto render in payment popup if passed |
| customerCity            | String          |	    false         | customer city - auto render in payment popup if passed    |
| paymentCancellationMsg  | String          |	    false         | message returned when user cancels the payment            |
| debugMode               | bool            |	    false         | to enable or disable package logs                         |



## Show some :heart: and star the repo to support the project

 [![GitHub followers](https://img.shields.io/github/followers/joshuachinemezu.svg?style=social&label=Follow)](https://github.com/joshuachinemezu)  [![Twitter Follow](https://img.shields.io/twitter/follow/joshuachinemezu.svg?style=social)](https://twitter.com/joshuachinemezu)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/Apache-2.0)


## 👨 Developed with :heart: by

```
Joshua Chinemezu
```


<a href="https://twitter.com/joshuachinemezu"><img src="https://user-images.githubusercontent.com/35039342/55471524-8e24cb00-5627-11e9-9389-58f3d4419153.png" width="60"></a>
<a href="https://www.linkedin.com/in/joshuachinemezu/"><img src="https://user-images.githubusercontent.com/35039342/55471530-94b34280-5627-11e9-8c0e-6fe86a8406d6.png" width="60"></a>
<a href="https://www.facebook.com/joshua.chinemezu"><img src="https://github.com/aritraroy/social-icons/blob/master/facebook-icon.png?raw=true" width="60"></a>
<a href="https://medium.com/@joshuachinemezu"><img src="https://user-images.githubusercontent.com/35039342/60429733-5a9f1000-9c19-11e9-9243-54052a4e4f05.png" width="60"></a>


# 👍 How to Contribute

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# 📃 License

    Copyright (c) 2020 Joshua Chinemezu

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
