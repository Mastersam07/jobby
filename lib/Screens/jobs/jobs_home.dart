import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobby/Screens/jobs/all_jobs.dart';
import 'package:jobby/Widgets/company_card.dart';
import 'package:jobby/Widgets/recent_job_card.dart';
import 'package:jobby/models/job.dart';
import 'package:jobby/providers/jobs.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'jobs_detail.dart';

class JobsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allJobs = Provider.of<JobProvider>(context).allJobs;
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        backgroundColor: kSilver,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            top: 12.0,
            bottom: 12.0,
            right: 12.0,
          ),
          child: SvgPicture.asset(
            "assets/images/drawer.svg",
            color: kBlack,
          ),
        ),
        actions: <Widget>[
          SvgPicture.asset(
            "assets/images/user.svg",
            width: 25.0,
            color: kBlack,
          ),
          SizedBox(width: 18.0)
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 18.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25.0),
              Text(
                "Hi,\nFind your Dream Job",
                style: kPageTitleStyle,
              ),
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.only(right: 18.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          cursorColor: kBlack,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              size: 25.0,
                              color: kBlack,
                            ),
                            border: InputBorder.none,
                            hintText: "Search for job title",
                            hintStyle: kSubtitleStyle.copyWith(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        color: kBlack,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Icon(
                        FontAwesomeIcons.slidersH,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 35.0),
              Text(
                "Popular Jobs",
                style: kTitleStyle,
              ),
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 190.0,
                child: Selector<JobProvider, List<Job>>(
                    selector: (context, jobProvider) {
                  return jobProvider.allJobs;
                }, builder: (context, allJobsFromProvider, _) {
                  return allJobsFromProvider.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          reverse: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var company = allJobs[index];
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
                                child: CompanyCard(company: company)
                                // : CompanyCard2(company: company),
                                );
                          },
                        );
                }),
              ),
              SizedBox(height: 35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Jobs",
                    style: kTitleStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllJobs(
                            allJobs: allJobs,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Text(
                          "Show All",
                          style: kTitleStyle,
                        ),
                    ),
                  ),
                ],
              ),
              Selector<JobProvider, List<Job>>(
                selector: (context, jobProvider) {
                  return jobProvider.allJobs;
                },
                builder: (context, allJobsFromProvider, _) {
                  return allJobsFromProvider.isEmpty &
                          (Provider.of<JobProvider>(context).fetchstatus ==
                              Fetch.Busy)
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: allJobsFromProvider.length.clamp(0, 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var recent = allJobs[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      company: recent,
                                    ),
                                  ),
                                );
                              },
                              child: RecentJobCard(company: recent),
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
