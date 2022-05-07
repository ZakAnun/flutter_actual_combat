import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 滚动测试页面
class NestedScrollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NestedScrollPageState();
  }
}

class _NestedScrollPageState extends State<NestedScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.pink,
          height: 44,
        ),
        Expanded(
            child: NestedScrollView(
                scrollDirection: Axis.vertical,
                headerSliverBuilder:
                    (BuildContext context, bool innerScrolled) => <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              color: Colors.red,
                              height: 16,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              color: Colors.white,
                              height: 16,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              color: Colors.blue,
                              height: 16,
                            ),
                          ),
                        ],
                body: NestedScrollView(
                  scrollDirection: Axis.vertical,
                  headerSliverBuilder:
                      (BuildContext context, bool innerScrolled) => <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.black,
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.yellow,
                        height: 24,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.green,
                        height: 24,
                      ),
                    ),
                  ],
                  body: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 12,
                          child: Text('index = $index'),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                )
            )
        )
      ],
    );
  }
}
