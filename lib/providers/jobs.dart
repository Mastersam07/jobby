import 'package:flutter/material.dart';

import 'package:jobby/models/job.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/services/api.dart';
import 'package:jobby/utils/exceptions.dart';
import 'package:jobby/utils/job_response.dart';

enum Fetch { Uninitialized, Busy, Idle }

class JobProvider with ChangeNotifier {
  bool _initialized = false;
  Fetch _fetchstatus = Fetch.Uninitialized;

  Fetch get fetchstatus => _fetchstatus;

  // AuthProvier
  AuthProvider authProvider;

  // Stores separate lists for all and saved jobs.
  List<Job> _allJobs = List<Job>();
  List<Job> _allSavedJobs = List<Job>();

  // API Service
  ApiService apiService;

  // Provides access to private variables.
  bool get initialized => _initialized;
  List<Job> get allJobs => _allJobs;
  List<Job> get allSavedJobs => _allSavedJobs;

  // AuthProvider is required to instaniate our ApiService.
  // This gives the service access to the user token and provider methods.
  JobProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    init();
  }

  void init() async {
    try {
      _fetchstatus = Fetch.Busy;
      AllJobResponse allJobsResponse = await apiService.getAllJobs();
      AllJobResponse allSavedJobsResponse = await apiService.getAllSavedJobs();

      _initialized = true;
      _fetchstatus = Fetch.Idle;
      _allJobs = allJobsResponse.jobs;
      _allSavedJobs = allSavedJobsResponse.jobs;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  Future<void> saveJob(String text) async {
    try {
      // save a new job for user.
      int id = await apiService.saveJob(text);

      // If no exceptions were thrown by API Service,
      // we add the item to _allSavedJobs.
      Job job = new Job();
      // job.value = text;
      job.id = id;
      // job.status = 'open';

      List<Job> allSavedJobsModified = _allSavedJobs;
      allSavedJobsModified.insert(0, job);

      _allSavedJobs = allSavedJobsModified;
      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }
}
