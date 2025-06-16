import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 167, 166, 166),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 151, 151, 151),
            highlightColor: Color.fromARGB(255, 200, 200, 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 64, 64, 64),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  spacing: 8,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 64, 64, 64),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 64, 64, 64),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 64, 64, 64),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                      ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}