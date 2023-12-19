import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:glass_morphism/grid_details/sub_grid.dart';

class GridHome extends StatefulWidget {
  const GridHome({super.key});

  @override
  State<GridHome> createState() => _GridHomeState();
}

class _GridHomeState extends State<GridHome> {
  final CollectionReference gridItem =
      FirebaseFirestore.instance.collection('gridItem');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: StreamBuilder(
          stream: gridItem.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data?.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => SubGrid(name: data["name"]))));
                    },
                    child: Stack(
                      children: [
                        GlassContainer.clearGlass(
                          height: 200,
                          width: 200,
                          borderRadius: BorderRadius.circular(20),
                          borderColor: Colors.black.withOpacity(0.2),
                          borderWidth: 0.2,
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 45,
                            ),
                            child: Text(
                              data['name'],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: 20,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(data['image']))),
                            ))
                      ],
                    ),
                  );
                  // return Container(
                  //   child: Stack(
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           ClipRRect(
                  //             borderRadius: BorderRadius.circular(10),
                  //             child: BackdropFilter(
                  //               filter: ImageFilter.blur(
                  //                 sigmaX: 10,
                  //                 sigmaY: 10,
                  //               ),
                  //               child: Container(
                  //                 height: 150,
                  //                 width: 170,
                  //                 //padding: const EdgeInsets.all(20),
                  //                 decoration: BoxDecoration(
                  //                   color: Color.fromARGB(255, 84, 125, 196)
                  //                       .withOpacity(0.3),
                  //                   image: DecorationImage(
                  //                     image: NetworkImage(
                  //                       gridItemSnap['image'],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 15),
                  //           Text(
                  //             gridItemSnap['name'],
                  //             style: const TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
