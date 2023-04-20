import 'package:flutter/material.dart';

class SyncHorizontalScroll extends StatefulWidget {
  @override
  _SyncHorizontalScrollState createState() => _SyncHorizontalScrollState();
}

class _SyncHorizontalScrollState extends State<SyncHorizontalScroll> {
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller1.addListener(() {
      if (_controller1.position.pixels != _controller2.position.pixels) {
        _controller2.animateTo(
          _controller1.position.pixels,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    // may only one controller take control will scroll smooth..
    // _controller2.addListener(() {
      // if (_controller2.position.pixels != _controller1.position.pixels) {
      //   _controller1.animateTo(
      //     _controller2.position.pixels,
      //     duration: Duration(milliseconds: 300),
      //     curve: Curves.easeOut,
      //   );
      // }
    // });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller1,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  color: index % 2 == 0 ? Colors.red : Colors.blue,
                );
              },
            )
        ),
        Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller2,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  color: index % 2 == 0 ? Colors.yellow : Colors.purple,
                );
              },
            )
        ),
      ],
    );
  }
}
