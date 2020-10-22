import 'package:flutter/material.dart';
import 'package:jobby/models/job.dart';

import '../constants.dart';

class CompanyCard extends StatelessWidget {
  final Job company;
  CompanyCard({this.company});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: EdgeInsets.only(right: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/nike-Logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                company.type,
                style: kTitleStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            company.title,
            style: kTitleStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: company.companyName,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "  •  ",
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: company.location,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Row(
              children: [
                for (int index = 0;
                    company.tags.length >= 2
                        ? index < 2
                        : index < company.tags.length;
                    index++)
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: kBlackAccent,
                    ),
                    child: Text(
                      company.tags[index],
                      style: kSubtitleStyle.copyWith(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  )
              ].toList(),
            ),
          ),
        ],
      ),
    );
  }
}
