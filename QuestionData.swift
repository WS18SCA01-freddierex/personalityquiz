//
//  QuestionData.swift
//  personalityquiz
//
//  Created by freddieRex on 1/25/19.
//  Copyright © 2019 Fredrex Enterprises. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, range
}

struct Answer{
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case dog = "🐶", cat = "🐱" ,rabbit = "🐰", turtle = "🐢"
    
    var definition:String{
        switch self {
        case .dog:
            return "You are incredibility outgoing. You surround yourself with the people you love and enjoy activities with your friends"
        case .cat:
            return "Michivious, yet mild-tempted, you enjoy doing things on your own term."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy"
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        
        default:
            <#code#>
        }
    }
}
