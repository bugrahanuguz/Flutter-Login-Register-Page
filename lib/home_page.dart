import 'package:flutter/material.dart';
import 'login_page.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ana Sayfa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: TabBar(
            onTap: (tabIndex) {
              setState(() {
                _tabController.index = tabIndex;
              });
            },
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blueGrey,
            padding: const EdgeInsets.all(2),
            indicatorWeight: 2,
            indicatorColor: Colors.amber,
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            tabs: const [
              Icon(
                Icons.home,
                size: 30,
                //color: Colors.greenAccent,
              ),
              Icon(
                Icons.cast_for_education,
                size: 30,
                //color: Colors.greenAccent,
              ),
              Icon(
                Icons.person,
                size: 30,
                // color: Colors.greenAccent,
              )
            ]),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _tabController.index == 0
            ? Center(
                child: Text(
                  "Ana Sayfa",
                  style: _style,
                ),
              )
            : _tabController.index == 1
                ? Center(
                    child: Text(
                      "Eğitim Sayfam",
                      style: _style,
                    ),
                  )
                : Center(
                    child: Text(
                    "Profil Sayfam",
                    style: _style,
                  ))
      ]),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: [
      //     Center(
      //         child: Text(
      //       "Ana Sayfam",
      //       style: _style,
      //     )),
      //     Center(
      //       child: Text(
      //         "Eğitim Sayfası",
      //         style: _style,
      //       ),
      //     ),
      //     Center(
      //       child: Text(
      //         "Profil Sayfam",
      //         style: _style,
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  final TextStyle _style = TextStyle(
      color: Colors.grey.shade900, fontWeight: FontWeight.w600, fontSize: 20);
}
