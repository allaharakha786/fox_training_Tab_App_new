// To parse this JSON data, do
//
//     final userWorkoutModel = userWorkoutModelFromJson(jsonString);

import 'dart:convert';

UserWorkoutModel userWorkoutModelFromJson(String str) =>
    UserWorkoutModel.fromJson(json.decode(str));

String userWorkoutModelToJson(UserWorkoutModel data) =>
    json.encode(data.toJson());

class UserWorkoutModel {
  String message;
  Workout workout;

  UserWorkoutModel({
    required this.message,
    required this.workout,
  });

  factory UserWorkoutModel.fromJson(Map<String, dynamic> json) =>
      UserWorkoutModel(
        message: json["message"],
        workout: Workout.fromJson(json["workout"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "workout": workout.toJson(),
      };
}

class Workout {
  Station station;
  String userId;
  int weekNumber;
  String programId;
  String workOutId;

  Workout({
    required this.station,
    required this.userId,
    required this.weekNumber,
    required this.programId,
    required this.workOutId,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        station: Station.fromJson(json["station"]),
        userId: json["userId"],
        weekNumber: json["weekNumber"],
        programId: json["programId"],
        workOutId: json["workOutId"],
      );

  Map<String, dynamic> toJson() => {
        "station": station.toJson(),
        "userId": userId,
        "weekNumber": weekNumber,
        "programId": programId,
        "workOutId": workOutId,
      };
}

class Station {
  String exerciseName;
  int stationNumber;
  List<Set> sets;
  String id;
  bool? completed;

  Station({
    required this.exerciseName,
    required this.stationNumber,
    required this.sets,
    required this.id,
    this.completed,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        exerciseName: json["exerciseName"],
        stationNumber: json["stationNumber"],
        sets: List<Set>.from(json["sets"].map((x) => Set.fromJson(x))),
        id: json["_id"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "stationNumber": stationNumber,
        "sets": List<dynamic>.from(sets.map((x) => x.toJson())),
        "_id": id,
        "completed": completed,
      };
}

class Set {
  int previous;
  int lbs;
  int reps;
  String id;

  Set({
    required this.previous,
    required this.lbs,
    required this.reps,
    required this.id,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        previous: json["previous"],
        lbs: json["lbs"],
        reps: json["reps"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "previous": previous,
        "lbs": lbs,
        "reps": reps,
        "_id": id,
      };
}
