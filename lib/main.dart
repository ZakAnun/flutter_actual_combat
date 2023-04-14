import 'package:flutter/material.dart';
import 'package:flutter_actual_combat/page/test_page.dart';
import 'package:share_extend/share_extend.dart';

void main() {
  // test();

  runApp(MyApp());
}

Future shouldNotLastMoreThan5sec() {
  print("开始时间 = ${new DateTime.now().millisecondsSinceEpoch}");
  Future foo = Future.delayed(const Duration(seconds: 10));
  return foo.timeout(Duration(seconds: 5), onTimeout: () {
    //cancel future ??
    throw ('Timeout');
  });
}

Future test() async {
  try {
    await shouldNotLastMoreThan5sec(); //this shoud not last more than 5 seconds
  } catch (e) {
    print('the error is ${e.toString()}');
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
      home: Scaffold(
        appBar: AppBar(
            title: const Text('测试实现效果...', style: TextStyle(fontSize: 16),),
          actions: <Widget> [
            GestureDetector(
              onTap: () async {
                ShareExtend.share("share text", "text",);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Icon(Icons.share, size: 16,),
              ),
            )
          ],
        ),
        // body: MyHomePage(title: 'Flutter Demo Home Page'),
        // body: NestedScrollPage(),
        // body: SignTestPage(),
        // body: DragGridItemPage(),
        body: FixedFirstColumnTable(
          data: [
            ['1', '2', '3', '4', '5'],
            ['6', '7', '8', '9', '10'],
            ['11', '12', '13', '14', '15'],
            ['12', '13', '14', '15', '16'],
            ['13', '14', '15', '16', '17'],
            ['14', '15', '16', '17', '18'],
            ['15', '16', '17', '18', '19'],
            ['16', '17', '18', '19', '10'],
            ['17', '18', '19', '10', '11'],
            ['18', '19', '10', '11', '12'],
            ['19', '10', '11', '12', '13'],
            ['10', '11', '12', '13', '14'],
          ],
        ),
      ),
    );
  }
}
