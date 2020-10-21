import 'package:flutter/material.dart';
import 'package:jobby/models/job.dart';
// import 'package:jobby/models/data.dart';

class AllJobs extends StatelessWidget {
  final List<Job> allJobs;
  AllJobs({this.allJobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: 32, left: 32, top: 48, bottom: 32),
              child: Text(
                "All \njobs (" + allJobs.length.toString() + ")",
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 32, left: 32, bottom: 8),
              child: Column(
                children: buildApplications(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildApplications() {
    List<Widget> list = [];
    for (var i = 0; i < allJobs.length; i++) {
      list.add(buildApplication(allJobs[i]));
    }
    return list;
  }

  Widget buildApplication(Job job) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/nike-Logo.png"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      job.companyName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )),
              Icon(
                Icons.more_vert,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 45,
          //         decoration: BoxDecoration(
          //           color: Colors.grey[200],
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(10),
          //           ),
          //         ),
          //         child: Center(
          //           child: Text(
          //             job.type,
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 16,
          //               color: application.status == "Opened"
          //                   ? Colors.green[500]
          //                   : application.status == "Cancelled"
          //                       ? Colors.red[500]
          //                       : Colors.black,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         child: Center(
          //           child: Text(
          //             r"$" + job. + "/h",
          //             style: TextStyle(
          //               fontSize: 24,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
