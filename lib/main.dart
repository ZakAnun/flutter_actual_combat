import 'package:flutter/material.dart';
import 'package:flutter_actual_combat/page/test_page.dart';

void main() {

  // test();

  runApp(MyApp());
}

Future shouldNotLastMoreThan5sec() {
  print("开始时间 = ${new DateTime.now().millisecondsSinceEpoch}");
  Future foo = Future.delayed(const Duration(seconds: 10));
  return foo.timeout(Duration(seconds: 5), onTimeout: (){
    //cancel future ??
    throw ('Timeout');
  });
}

Future test() async {
  try{
    await shouldNotLastMoreThan5sec(); //this shoud not last more than 5 seconds
  }catch (e){
    print ('the error is ${e.toString()}');
    print("异常捕获时间 = ${new DateTime.now().millisecondsSinceEpoch}");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("开始 build widget");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: NestedScrollPage(),
      // home: SignTestPage(),
      home: DragGridItemPage(),
    );
  }
}
