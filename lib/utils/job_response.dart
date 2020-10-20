import 'package:jobby/models/job.dart';

class AllJobResponse {
  final List<Job> jobs;
  // final String apiMore;
  AllJobResponse(this.jobs);
}

class JobResponse {
  final Job job;
  // final String apiMore;
  JobResponse(this.job);
}
