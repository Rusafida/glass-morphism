import 'package:flutter/material.dart';

import 'widgets/tab_items.dart';
import 'widgets/tabbar_pages/filter.dart';
import 'widgets/tabbar_pages/offer.dart';
import 'widgets/tabbar_pages/popular.dart';
import 'widgets/tabbar_pages/sales.dart';

class SubGrid extends StatefulWidget {
  final String name;
  const SubGrid({super.key, required this.name});

  @override
  State<SubGrid> createState() => _SubGridState();
}

class _SubGridState extends State<SubGrid> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Stack(
              children: [
                TabBar(
                  overlayColor:
                        const MaterialStatePropertyAll(Color.fromARGB(0, 220, 74, 74)),
                    labelPadding: const EdgeInsets.only(left: 5),
                    indicatorPadding: const EdgeInsets.only(
                        left: 11, bottom: 9, top: 7, right: 2),
                    indicator: BoxDecoration(
                        color: const Color.fromARGB(255, 22, 82, 130),
                        borderRadius: BorderRadius.circular(10)),
                    isScrollable: true,
                  tabs: [
                    Tab(
                      child: TabItems(
                        name: 'sale',
                      ),
                    ),
                    Tab(
                      child: TabItems(
                        name: 'popular',
                      ),
                    ),
                    Tab(
                      child: TabItems(
                        name: 'Filter',
                      ),
                    ),
                    
                  ],
                  
                )
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: const [
              Expanded(
                child: TabBarView(
                  children: [
                    Sales(),
                    Popular(),
                    Filterpage(),
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
