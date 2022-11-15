// ignore: file_names
// ignore: file_names
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard(
      {super.key,
      required this.companyName,
      required this.jobTittle,
      required this.logoImage,
      required this.hourlyRate});
  final String companyName;
  final String jobTittle;
  final String logoImage;
  final int hourlyRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          color: Colors.grey[200],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  child: Image.asset(logoImage),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[300],
                    child: const Text(
                      'Part Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15),
              child: Text(
                jobTittle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hourlyRate.toString(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
