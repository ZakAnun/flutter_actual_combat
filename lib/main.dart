import 'package:flutter/material.dart';
import 'package:flutter_actual_combat/page/test_page.dart';
import 'package:flutter_actual_combat/widget/test_widget.dart';
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
        // body: FixedColumnTable(
        //   // headers: [
        //   //   '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'
        //   //   '11', '21', '31', '41', '51', '61', '71', '81', '91', '101'
        //   //   '12', '22', '32', '42', '52', '62', '72', '82', '92', '102'
        //   //   '13', '23', '33', '43', '53', '63', '73', '83', '93', '103'
        //   //   '14', '24', '34', '44', '54', '64', '74', '84', '94', '104'
        //   //   '15', '25', '35', '45', '55', '65',
        //   // ],
        //   data: [
        //     ['1', '2', '3', '4', '5'],
        //     ['2', '7', '8', '9', '10'],
        //     ['3', '12', '13', '14', '15'],
        //     ['4', '13', '14', '15', '16'],
        //     ['5', '14', '15', '16', '17'],
        //     ['6', '15', '16', '17', '18'],
        //     ['7', '16', '17', '18', '19'],
        //     ['8', '17', '18', '19', '10'],
        //     ['9', '18', '19', '10', '11'],
        //     ['10', '19', '10', '11', '12'],
        //     ['11', '10', '11', '12', '13'],
        //     ['12', '11', '12', '13', '14'],
        //     ['13', '7', '8', '9', '10'],
        //     ['14', '12', '13', '14', '15'],
        //     ['15', '13', '14', '15', '16'],
        //     ['16', '14', '15', '16', '17'],
        //     ['17', '15', '16', '17', '18'],
        //     ['18', '16', '17', '18', '19'],
        //     ['19', '17', '18', '19', '10'],
        //     ['20', '18', '19', '10', '11'],
        //     ['21', '19', '10', '11', '12'],
        //     ['22', '10', '11', '12', '13'],
        //     ['23', '11', '12', '13', '14'],
        //     ['24', '7', '8', '9', '10'],
        //     ['25', '12', '13', '14', '15'],
        //     ['26', '13', '14', '15', '16'],
        //     ['27', '14', '15', '16', '17'],
        //     ['28', '15', '16', '17', '18'],
        //     ['29', '16', '17', '18', '19'],
        //     ['30', '17', '18', '19', '10'],
        //     ['31', '18', '19', '10', '11'],
        //     ['32', '19', '10', '11', '12'],
        //     ['33', '10', '11', '12', '13'],
        //     ['34', '11', '12', '13', '14'],
        //     ['35', '7', '8', '9', '10'],
        //     ['36', '12', '13', '14', '15'],
        //     ['37', '13', '14', '15', '16'],
        //     ['38', '14', '15', '16', '17'],
        //     ['39', '15', '16', '17', '18'],
        //     ['40', '16', '17', '18', '19'],
        //     ['41', '17', '18', '19', '10'],
        //     ['42', '18', '19', '10', '11'],
        //     ['43', '19', '10', '11', '12'],
        //     ['44', '10', '11', '12', '13'],
        //     ['45', '11', '12', '13', '14'],
        //     ['46', '7', '8', '9', '10'],
        //     ['47', '12', '13', '14', '15'],
        //     ['48', '13', '14', '15', '16'],
        //     ['49', '14', '15', '16', '17'],
        //     ['50', '15', '16', '17', '18'],
        //     ['51', '16', '17', '18', '19'],
        //     ['52', '17', '18', '19', '10'],
        //     ['53', '18', '19', '10', '11'],
        //     ['54', '19', '10', '11', '12'],
        //     ['55', '10', '11', '12', '13'],
        //     ['56', '11', '12', '13', '14'],
        //   ],
        // ),
        // body: SyncHorizontalScroll(),
        // body: TestOverlayEntity(),
        // body: ToggleButtonWidget(),
        body: TwoHalfCircleWidget(),
      ),
    );
  }
}
