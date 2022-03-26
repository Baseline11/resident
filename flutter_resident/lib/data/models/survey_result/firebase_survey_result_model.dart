import 'package:equatable/equatable.dart';

class FirebaseSurveyResultModel extends Equatable {
  final String? userUid;
  final String? surveyId;
  final String? answer;

  FirebaseSurveyResultModel({
    this.userUid,
    this.surveyId,
    this.answer,
  });

  FirebaseSurveyResultModel copyWith(
      {String? userUid, String? surveyid, String? answer}) {
    return FirebaseSurveyResultModel(
      userUid: userUid ?? this.userUid,
      surveyId: surveyid ?? this.surveyId,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'survey_id': surveyId,
        'user_uid': userUid,
      };

  List<Object?> get props => [userUid, surveyId, answer];
}
