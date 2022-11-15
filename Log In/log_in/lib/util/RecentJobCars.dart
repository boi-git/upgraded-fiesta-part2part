import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentJobCards extends StatelessWidget {
  const RecentJobCards(
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
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //image settings
                        height: 60,
                        color: Colors.grey[200],
                        child: Image.asset(logoImage),
                      ),
                    ),
                    Padding(
                      //text settings
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(jobTittle), Text(companyName)],
                      ),
                    ),
                  ]),
                  ClipRRect(
                    //number on left settings
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Color.fromARGB(255, 22, 216, 77),
                      child: Text(
                        hourlyRate.toString(),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
