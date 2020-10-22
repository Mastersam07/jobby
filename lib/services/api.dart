import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:jobby/models/job.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/utils/exceptions.dart';
import 'package:jobby/utils/job_response.dart';

class ApiService {
  AuthProvider authProvider;
  String token;

  // The AuthProvider is passed in when this class instantiated.
  // This provides access to the user token required for API calls.
  // It also allows us to log out a user when their token expires.
  ApiService(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.token = authProvider.token;
  }

  final String api = 'http://devjobhub.herokuapp.com/api/v1';

  /*
  * Validates the response code from an API call.
  * A 401 indicates that the token has expired.
  * A 200 or 201 indicates the API call was successful.
  */
  void validateResponseStatus(int status, int validStatus) {
    if (status == 401) {
      throw new AuthException("401", "Unauthorized");
    }

    if (status != validStatus) {
      throw new ApiException(status.toString(), "API Error");
    }
  }

  /// Returns a list of jobs.
  Future<AllJobResponse> getAllJobs() async {
    final url = "$api/jobs/";

    final response = await http.get(url
        // headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        );

    validateResponseStatus(response.statusCode, 200);

    var apiResponse = json.decode(response.body);
    List<dynamic> data = apiResponse;

    List<Job> jobs = jobFromJson(json.encode(data));

    return AllJobResponse(jobs);
  }

  /// Returns a specific jobs.
  Future<JobResponse> getAJob(String id) async {
    final url = "$api/jobs/$id";

    final response = await http.get(
      url,
      // headers: {'Authorization': 'Bearer $token'},
    );

    validateResponseStatus(response.statusCode, 200);

    var apiResponse = json.decode(response.body);

    Job job = Job.fromJson(apiResponse);

    return JobResponse(job);
  }

  ///  Saves a job.
  saveJob(String jid) async {
    final url = '$api/save-job/$jid';
    Map<String, String> body = {
      'job': jid,
    };

    final response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: body);

    validateResponseStatus(response.statusCode, 201);

    /// Returns the id of the newly created item.
    Map<String, dynamic> apiResponse = json.decode(response.body);
    int id = apiResponse['id'];
    return id;
  }

  /// Returns a list of saved jobs.
  Future<AllJobResponse> getAllSavedJobs() async {
    print("geting saved jobs...");
    final url = "$api/saved-jobs";

    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.statusCode);
    print(response.body);
    print("done with response!");

    validateResponseStatus(response.statusCode, 200);

    var apiResponse = json.decode(response.body);
    List<dynamic> data = apiResponse;

    List<Job> jobs = jobFromJson(json.encode(data));

    return AllJobResponse(jobs);
  }

  /// Returns a saved job.
  Future<JobResponse> getASavedJobs(String id) async {
    final url = "$api/saved-job/$id";

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    validateResponseStatus(response.statusCode, 200);

    var apiResponse = json.decode(response.body);

    Job job = Job.fromJson(apiResponse["fields"]);

    return JobResponse(job);
  }
}
