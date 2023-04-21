import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rentalsuitstate/style.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        body: TabBarView(
          children: [
            Tab(
              child: SearchCondition(),
            ),
            Tab(
              child: Container(),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: whiteColor,
          child: TabBar(
            labelColor: whiteColor,
            unselectedLabelColor: blackColor,
            indicator: BoxDecoration(
              color: blackColor,
            ),
            tabs: [
              Container(
                height: 64,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text('Search'),
                  ],
                ),
              ),
              Container(
                height: 64,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month),
                    Text('Calender'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------- Tab_1 -----------------------------------------------
class SearchCondition extends StatefulWidget {
  const SearchCondition({super.key});

  @override
  State<SearchCondition> createState() => _SearchConditionState();
}

TextEditingController inputKeyword = TextEditingController();

class _SearchConditionState extends State<SearchCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
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
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: inputKeyword,
                          onChanged: (_inputSearch) {
                            print(_inputSearch);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: whiteColor,
                            prefixIcon: Icon(
                              Icons.search,
                              color: blackColor,
                            ),
                            hintText: '검색어를 입력하세요.',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 72,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Num / Size(Type)',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            'State',
                            style: TextStyle(
                              fontSize: 16,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const QRViewExample(),
          ));
        },
        backgroundColor: blackColor,
        child: const Icon(
          Icons.qr_code_rounded,
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildQrView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });
    qrController.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        inputKeyword.text = scanData.toString();
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}

// ----------------------------------------------- Tab_2 -----------------------------------------------