import 'package:flutter/material.dart';
import 'package:rentalsuitstate/style.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SearchCondition(),
      ),
    );
  }
}

class SearchQr extends StatelessWidget {
  const SearchQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: mainColor,
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
      ],
    );
  }
}
