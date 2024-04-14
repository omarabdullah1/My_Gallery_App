///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class QuizModelQuizQuestionsPivot {
/*
{
  "quiz_id": 43,
  "question_id": 52
} 
*/

  int? quizId;
  int? questionId;

  QuizModelQuizQuestionsPivot({
    this.quizId,
    this.questionId,
  });
  QuizModelQuizQuestionsPivot.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id']?.toInt();
    questionId = json['question_id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    data['question_id'] = questionId;
    return data;
  }
}

class QuizModelQuizQuestions {
/*
{
  "id": 52,
  "type": "MCQ",
  "title": "jUMh53",
  "desc": "HnB6FeyZvZs4knyZjJpIfOkDjXuXNl",
  "correct_answer": "correct",
  "choices": [
    "correct"
  ],
  "lesson_id": 28,
  "unit_id": 13,
  "pivot": {
    "quiz_id": 43,
    "question_id": 52
  }
}
*/

  int? id;
  String? type;
  String? title;
  String? desc;
  String? correctAnswer;
  List<String?>? choices;
  int? lessonId;
  int? unitId;
  QuizModelQuizQuestionsPivot? pivot;

  QuizModelQuizQuestions({
    this.id,
    this.type,
    this.title,
    this.desc,
    this.correctAnswer,
    this.choices,
    this.lessonId,
    this.unitId,
    this.pivot,
  });
  QuizModelQuizQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    type = json['type']?.toString();
    title = json['title']?.toString();
    desc = json['desc']?.toString();
    correctAnswer = json['correct_answer']?.toString();
    if (json['choices'] != null) {
      final v = json['choices'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      choices = arr0;
    }
    lessonId = json['lesson_id']?.toInt();
    unitId = json['unit_id']?.toInt();
    pivot = (json['pivot'] != null) ? QuizModelQuizQuestionsPivot.fromJson(json['pivot']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['desc'] = desc;
    data['correct_answer'] = correctAnswer;
    if (choices != null) {
      final v = choices;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['choices'] = arr0;
    }
    data['lesson_id'] = lessonId;
    data['unit_id'] = unitId;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class QuizModelQuiz {
/*
{
  "id": 43,
  "title": "Fk3153",
  "degree": 70,
  "quiz_duration": "10:47:26",
  "validated_weeks": 5,
  "questions": [
    {
      "id": 52,
      "type": "MCQ",
      "title": "jUMh53",
      "desc": "HnB6FeyZvZs4knyZjJpIfOkDjXuXNl",
      "correct_answer": "correct",
      "choices": [
        "correct"
      ],
      "lesson_id": 28,
      "unit_id": 13,
      "pivot": {
        "quiz_id": 43,
        "question_id": 52
      }
    }
  ]
}
*/

  int? id;
  String? title;
  int? degree;
  String? quizDuration;
  int? validatedWeeks;
  List<QuizModelQuizQuestions?>? questions;

  QuizModelQuiz({
    this.id,
    this.title,
    this.degree,
    this.quizDuration,
    this.validatedWeeks,
    this.questions,
  });
  QuizModelQuiz.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    degree = json['degree']?.toInt();
    quizDuration = json['quiz_duration']?.toString();
    validatedWeeks = json['validated_weeks']?.toInt();
    if (json['questions'] != null) {
      final v = json['questions'];
      final arr0 = <QuizModelQuizQuestions>[];
      v.forEach((v) {
        arr0.add(QuizModelQuizQuestions.fromJson(v));
      });
      questions = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['degree'] = degree;
    data['quiz_duration'] = quizDuration;
    data['validated_weeks'] = validatedWeeks;
    if (questions != null) {
      final v = questions;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['questions'] = arr0;
    }
    return data;
  }
}

class QuizModel {
/*
{
  "status": 200,
  "errorNum": "S000",
  "message": "Quiz detials have been returned successfully",
  "quiz": {
    "id": 43,
    "title": "Fk3153",
    "degree": 70,
    "quiz_duration": "10:47:26",
    "validated_weeks": 5,
    "questions": [
      {
        "id": 52,
        "type": "MCQ",
        "title": "jUMh53",
        "desc": "HnB6FeyZvZs4knyZjJpIfOkDjXuXNl",
        "correct_answer": "correct",
        "choices": [
          "correct"
        ],
        "lesson_id": 28,
        "unit_id": 13,
        "pivot": {
          "quiz_id": 43,
          "question_id": 52
        }
      }
    ]
  }
} 
*/

  int? status;
  String? errorNum;
  String? message;
  QuizModelQuiz? quiz;

  QuizModel({
    this.status,
    this.errorNum,
    this.message,
    this.quiz,
  });
  QuizModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    errorNum = json['errorNum']?.toString();
    message = json['message']?.toString();
    quiz = (json['quiz'] != null) ? QuizModelQuiz.fromJson(json['quiz']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['errorNum'] = errorNum;
    data['message'] = message;
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    return data;
  }
}
