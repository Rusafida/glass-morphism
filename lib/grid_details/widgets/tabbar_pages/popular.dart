

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference popular=
        FirebaseFirestore.instance.collection('popular');
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: popular.snapshots(),
          builder: (context,snapshot){
             if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data?.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
          
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: GlassContainer.clearGlass(height: 200, width: 200),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Text(
                              data['name'],
                              style: GoogleFonts.notoSans(
                                  fontSize: 14,
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
                              image: DecorationImage(
                                image: NetworkImage(data['image']),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
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