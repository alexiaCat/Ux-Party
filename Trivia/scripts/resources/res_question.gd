extends Resource
class_name QuizQuestion

enum QuestionType {TEXT, IMAGE}

export(String) var question_info
export(QuestionType) var type
export(Texture) var question_image
export(Array, String) var options
export(String) var correct
