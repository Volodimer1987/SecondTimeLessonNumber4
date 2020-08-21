//
//  Question.swift
//  SecondTimeLessonNumber4
//
//  Created by vladimir gennadievich on 20.08.2020.
//  Copyright © 2020 Vladimir Gennadievich. All rights reserved.
//

import Foundation

struct Question {
    var text:String
    var type:ResponseType
    var answers:[Answer]
}
extension Question {
    static func getQuestions() -> [Question] {
        return[
            Question(text: "Какую пищу вы предпочитаете?", type: .single, answers: [
                Answer(text:"Cтейк", type: .dog),
                Answer(text: "Рыба", type: .cat),
                Answer(text: "Морковь", type: .rabbit),
                Answer(text: "Кукуруза", type: .turtle)
            ]),
            Question(text: "Что вам нравится больше?", type: .multiple, answers: [
                Answer(text:"Плавать", type: .dog),
                Answer(text: "Спать", type: .cat),
                Answer(text: "Обниматся", type: .rabbit),
                Answer(text: "Есть", type: .turtle)]),
            
            Question(text: "Любите ли вы поездки на машине", type: .ranged, answers: [
                Answer(text:"Ненавижу", type: .dog),
                Answer(text: "Нерничаю", type: .cat),
                Answer(text: "Не замичаю", type: .rabbit),
                Answer(text: "Обожаю", type: .turtle)])
    
            
        ]
    }
}
