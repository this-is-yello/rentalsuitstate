import 'package:flutter/material.dart';
import 'package:rentalsuitstate/style.dart';

import 'dart:async';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '렌탈복 상태관리',
      home: RentalSuitState(),
    );
  }
}

class RentalSuitState extends StatefulWidget {
  const RentalSuitState({super.key});

  @override
  State<RentalSuitState> createState() => _RentalSuitStateState();
}

class _RentalSuitStateState extends State<RentalSuitState> {
  Future _scan() async {
    String barcode = await scanner.scan().toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SearchCondition(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scan(),
          tooltip: 'scan',
          child: const Icon(Icons.qr_code_rounded),
          backgroundColor: blackColor,
        ),
      ),
    );
  }
}

class SearchCondition extends StatefulWidget {
  const SearchCondition({super.key});

  @override
  State<SearchCondition> createState() => _SearchConditionState();
}

class _SearchConditionState extends State<SearchCondition> {
  var _inputSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                pinned: true,
                floating: true,
                centerTitle: true,
                automaticallyImplyLeading: false,
                expandedHeight: 120,
                toolbarHeight: 120,
                backgroundColor: blackColor,
                title: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        controller: _inputSearch,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: whiteColor,
                          prefixIcon: Icon(
                            Icons.search,
                            color: blackColor,
                          ),
                          hintText: '검색어를 입력하세요.',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: greyColor,
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Num / Size(Type)',
                          style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
