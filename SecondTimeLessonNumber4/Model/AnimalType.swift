//
//  AnimalType.swift
//  SecondTimeLessonNumber4
//
//  Created by vladimir gennadievich on 20.08.2020.
//  Copyright © 2020 Vladimir Gennadievich. All rights reserved.
//


enum AnimalType:String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition:String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями.Вы окружаете себя людьми которые вам нравятся и готовы им помочь."
        case .cat:
            return "Вы себе на умею.Любите гулять сами по себе.Вы цените оденочество"
        case .rabbit:
            return "Вам нравится все мягкое.Вы здоровы и полны эенергий"
        case .turtle:
            return "Ваша сила - в мудрости.Медленный и вдумчивый выигрывает на дальних дистанциях" 
        }
    }
}
