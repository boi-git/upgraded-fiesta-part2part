// ignore_for_file: file_names, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:log_in/util/JobCard.dart';

import 'util/RecentJobCars.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list for card [horizontal]
  final List jobsForYou = [
    ['CompanyName 1', 'JobTittle', 'lib/images/Instagram post - 3.png', 1],
    ['CompanyName 2', 'JobTittle', 'lib/images/Instagram post - 3.png', 2],
    ['CompanyName 3', 'JobTittle', 'lib/images/Instagram post - 3.png', 3]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appbar
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200]),
              child: Image.asset(
                'lib/images/Instagram post - 1.png',
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(height: 50),

          //discover a new path
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover a New Path',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const SizedBox(height: 50),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 30,
                            child: Image.asset(
                                'lib/images/Instagram post - 4.png'),
                          ),
                        ),
                        const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Search'),
                        ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'lib/images/Instagram post - 3.png',
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          //for you job cards
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                itemCount: jobsForYou.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return JobCard(
                      companyName: jobsForYou[index][0],
                      jobTittle: jobsForYou[index][1],
                      logoImage: jobsForYou[index][2],
                      hourlyRate: jobsForYou[index][3]);
                })),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //recelect add
          Expanded(
              child: ListView.builder(
            itemCount: jobsForYou.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return RecentJobCards(
                  companyName: jobsForYou[index][0],
                  jobTittle: jobsForYou[index][1],
                  logoImage: jobsForYou[index][2],
                  hourlyRate: jobsForYou[index][3]);
            },
          ))
        ],
      ),
    );
  }
}
