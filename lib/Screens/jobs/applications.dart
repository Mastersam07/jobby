import 'package:flutter/material.dart';
import 'package:jobby/Screens/jobs/jobs_detail.dart';
import 'package:jobby/models/job.dart';
import 'package:jobby/providers/jobs.dart';
import 'package:provider/provider.dart';

class Applications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allSavedJobs = Provider.of<JobProvider>(context).allSavedJobs;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, top: 48, bottom: 32),
            child: Text(
              "Saved \njobs (" + allSavedJobs.length.toString() + ")",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, bottom: 8),
            child: Selector<JobProvider, List<Job>>(
              selector: (context, jobProvider) {
                return jobProvider.allSavedJobs;
              },
              builder: (context, allJobsFromProvider, _) {
                return (Provider.of<JobProvider>(context).fetchstatus ==
                        Fetch.Busy || Provider.of<JobProvider>(context).fetchstatus ==
                        Fetch.Uninitialized)
                    ? Center(child: CircularProgressIndicator(),)
                    : (allJobsFromProvider.isEmpty)
                        ? Container()
                        : ListView.builder(
                            reverse: true,
                            itemCount: allSavedJobs.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var company = allSavedJobs[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobDetail(
                                          company: company,
                                        ),
                                      ),
                                    );
                                  },
                                  child: buildApplication(company));
                            },
                          );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildApplication(Job application) {
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
                      application.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      application.companyName,
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
        ],
      ),
    );
  }
}
