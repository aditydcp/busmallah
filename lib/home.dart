import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Antar Kota'),
    Tab(text: 'Dalam Kota'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          'BUSmallah App',
          style: GoogleFonts.lobster(
            fontSize: 30,
          )
        ),
        elevation: 0,
        bottom: TabBar(
          unselectedLabelColor: const Color.fromARGB(110, 6, 21, 50),
          indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
          indicator: ShapeDecoration(
            color: const Color(0xFF061532),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AntarKota(),
          DalamKota()
        ]
      ),
    );
  }
}

class AntarKota extends StatefulWidget {
  const AntarKota({ Key? key }) : super(key: key);

  @override
  State<AntarKota> createState() => _AntarKotaState();
}

class _AntarKotaState extends State<AntarKota> {

  var jumlahPenumpang = 1;
  final TextEditingController _controllerPenumpang = TextEditingController();

  void addPenumpang(){
    setState(() {
      jumlahPenumpang++;
    });
  }

  void removePenumpang(){
    setState(() {
      jumlahPenumpang <= 1 ? jumlahPenumpang = 1 : jumlahPenumpang--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for debugging
    // log(jumlahPenumpang.toString());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              child: Container(
                height: MediaQuery.of(context).size.height/7,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Header.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10)
                )
              )
            ),
            Card(
              elevation: 30,
              shadowColor: const Color(0xFFF0F0F0),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/30, horizontal: 18),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'ANTAR KOTA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      Divider(height: (MediaQuery.of(context).size.height/60), color: Colors.transparent,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Asal'),
                                const Divider(height: 5, color: Colors.transparent),
                                TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Tujuan'),
                                const Divider(height: 5, color: Colors.transparent),
                                TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/60, color: Colors.transparent,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tanggal Berangkat'),
                          const Divider(height: 5, color: Colors.transparent,),
                          TextField(
                            onChanged: (value){},
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                            ),
                          )
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/60, color: Colors.transparent,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jumlah Penumpang'),
                          const Divider(height: 5, color: Colors.transparent,),
                          TextField(
                            controller: _controllerPenumpang,
                            onChanged: (value) {},
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: jumlahPenumpang.toString()+' Penumpang',
                              hintStyle: const TextStyle(color: Colors.black),
                              
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: removePenumpang,
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.black
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: addPenumpang,
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )
                                  )
                                ],
                              ),
                              
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                            ),
                          )
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/30, color: Colors.transparent,),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: const Text(
                          'Cari Tiket',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE57259)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shadowColor: MaterialStateProperty.all<Color>(const Color(0x55E57259)),
                          elevation: MaterialStateProperty.all<double>(15),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          fixedSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width,50))
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DalamKota extends StatefulWidget {
  const DalamKota({ Key? key }) : super(key: key);

  @override
  State<DalamKota> createState() => _DalamKotaState();
}

class _DalamKotaState extends State<DalamKota> {

  var jumlahPenumpang = 1;
  final TextEditingController _controllerPenumpang = TextEditingController();

  void addPenumpang(){
    setState(() {
      jumlahPenumpang++;
    });
  }

  void removePenumpang(){
    setState(() {
      jumlahPenumpang <= 1 ? jumlahPenumpang = 1 : jumlahPenumpang--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for debugging
    // log(jumlahPenumpang.toString());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              child: Container(
                height: MediaQuery.of(context).size.height/7,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Header.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10)
                )
              )
            ),
            Card(
              elevation: 30,
              shadowColor: const Color(0xFFF0F0F0),
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/30, horizontal: 18),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'DALAM KOTA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                      Divider(height: (MediaQuery.of(context).size.height/60), color: Colors.transparent,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Asal'),
                                const Divider(height: 5, color: Colors.transparent),
                                TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Tujuan'),
                                const Divider(height: 5, color: Colors.transparent),
                                TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/60, color: Colors.transparent,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tanggal Berangkat'),
                          const Divider(height: 5, color: Colors.transparent,),
                          TextField(
                            onChanged: (value){},
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                            ),
                          )
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/60, color: Colors.transparent,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jumlah Penumpang'),
                          const Divider(height: 5, color: Colors.transparent,),
                          TextField(
                            controller: _controllerPenumpang,
                            onChanged: (value) {},
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: jumlahPenumpang.toString()+' Penumpang',
                              hintStyle: const TextStyle(color: Colors.black),
                              
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: removePenumpang,
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.black
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: addPenumpang,
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )
                                  )
                                ],
                              ),
                              
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                            ),
                          )
                        ],
                      ),
                      Divider(height: MediaQuery.of(context).size.height/30, color: Colors.transparent,),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: const Text(
                          'Cari Tiket',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE57259)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shadowColor: MaterialStateProperty.all<Color>(const Color(0x55E57259)),
                          elevation: MaterialStateProperty.all<double>(15),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          fixedSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width,50))
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}