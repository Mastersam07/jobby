import 'package:flutter/material.dart';

import 'package:jobby/models/job.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/services/api.dart';
import 'package:jobby/utils/exceptions.dart';
import 'package:jobby/utils/job_response.dart';

class JobProvider with ChangeNotifier {
  bool _initialized = false;

  // AuthProvier
  AuthProvider authProvider;

  // Stores separate lists for open and closed todos.
  List<Job> _allJobs = List<Job>();
  List<Job> _allSavedJobs = List<Job>();

  // The API is paginated. If there are more results we store
  // the API url in order to lazily load them later.
  // String _openTodosApiMore;
  // String _closedTodosApiMore;

  // API Service
  ApiService apiService;

  // Provides access to private variables.
  bool get initialized => _initialized;
  List<Job> get allJobs => _allJobs;
  List<Job> get allSavedJobs => _allSavedJobs;
  // String get openTodosApiMore => _openTodosApiMore;
  // String get closedTodosApiMore => _closedTodosApiMore;

  // AuthProvider is required to instaniate our ApiService.
  // This gives the service access to the user token and provider methods.
  JobProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    init();
  }

  void init() async {
    try {
      AllJobResponse allJobsResponse = await apiService.getAllJobs();
      AllJobResponse allSavedJobsResponse = await apiService.getAllSavedJobs();

      _initialized = true;
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

  // Future<bool> toggleTodo(Todo todo) async {
  //   List<Todo> openTodosModified = _openTodos;
  //   List<Todo> closedTodosModified = _closedTodos;

  //   // Get current status in case there's an error and new status isn't set.
  //   String status = todo.status;

  //   // Get the new status for the the todo.
  //   String statusModified = todo.status == 'open' ? 'closed' : 'open';

  //   // Set the todo status to processing while we wait for the API call to complete.
  //   todo.status = 'processing';
  //   notifyListeners();

  //   // Updates the status via an API call.
  //   try {
  //     await apiService.toggleTodoStatus(todo.id, statusModified);
  //   } on AuthException {
  //     // API returned a AuthException, so user is logged out.
  //     await authProvider.logOut(true);
  //     return false;
  //   } catch (Exception) {
  //     print(Exception);

  //     // If API update failed, we set the status back to original state.
  //     todo.status = status;
  //     notifyListeners();
  //     return false;
  //   }

  //   // Modify the todo with the new status.
  //   Todo modifiedTodo = todo;
  //   modifiedTodo.status = statusModified;

  //   if (statusModified == 'open') {
  //     openTodosModified.add(modifiedTodo);
  //     closedTodosModified.remove(todo);
  //   }

  //   if (statusModified == 'closed') {
  //     closedTodosModified.add(modifiedTodo);
  //     openTodosModified.remove(todo);
  //   }

  //   _openTodos = openTodosModified;
  //   _closedTodos = closedTodosModified;
  //   notifyListeners();
  //   return true;
  // }

  // Future<void> loadMore(String activeTab) async {
  //   // Set apiMore based on the activeTab.
  //   String apiMore =
  //       (activeTab == 'open') ? _openTodosApiMore : _closedTodosApiMore;

  //   // If there's no more items to load, return early.
  //   if (apiMore == null) {
  //     return;
  //   }

  //   try {
  //     // Make the API call to get more todos.
  //     TodoResponse todosResponse =
  //         await apiService.getTodos(activeTab, url: apiMore);

  //     // Get the current todos for the active tab.
  //     List<Todo> currentTodos =
  //         (activeTab == 'open') ? _openTodos : _closedTodos;

  //     // Combine current todos with new results from API.
  //     List<Todo> allTodos = [...currentTodos, ...todosResponse.todos];

  //     if (activeTab == 'open') {
  //       _openTodos = allTodos;
  //       _openTodosApiMore = todosResponse.apiMore;
  //     }

  //     if (activeTab == 'closed') {
  //       _closedTodos = allTodos;
  //       _closedTodosApiMore = todosResponse.apiMore;
  //     }

  //     notifyListeners();
  //   } on AuthException {
  //     // API returned a AuthException, so user is logged out.
  //     await authProvider.logOut(true);
  //   } catch (Exception) {
  //     print(Exception);
  //   }
  // }
}
