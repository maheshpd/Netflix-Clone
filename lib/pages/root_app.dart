import 'package:flutter/material.dart';
import 'package:netflix_clone/json/root_app_json.dart';
import 'package:netflix_clone/pages/home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        Center(
          child: Text("Coming Soon", style: TextStyle(fontSize: 20, color: Colors.white),),
        ),
        Center(
          child: Text("Search", style: TextStyle(fontSize: 20, color: Colors.white),),
        ),
        Center(
          child: Text("Downloads", style: TextStyle(fontSize: 20, color: Colors.white),),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      items[index]['text'],
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
