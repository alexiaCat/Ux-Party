extends Resource
class_name CydQuestion

enum QuestionType {TEXT, IMAGE}

export(String) var question_info
export(QuestionType) var type
export(Texture) var question_image
export(Array, Texture) var options
export(Texture) var correct
