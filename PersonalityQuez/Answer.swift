//
//  Answer.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/5/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation
struct Answer {
    var text : String
    var type : AnimalType
    init(text : String , type : AnimalType) {
        self.text = text
        self.type = type
    }
}
enum AnimalType : Character{
    case dog = "🐶" , cat = "🐱" , rabbit = "🐰" , turtle = "🐢"
    var definition : String{
        switch self {
        case .dog:
            return "You are incredibly outgoing . You surround yourself with the people you love and enjoy activities with your friends ."
        case .cat:
            return "Mischievous , yet mild - tempered , you enjoy doing things on your own terns ."
        case .rabbit:
            return "you love everything that's soft . You are healthy and full of energy ."
        case.turtle:
            return "You are wise beyond your years , and you focus on the details . Slow and steady wins the race ."
        }
        
    }
}
