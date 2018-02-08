//
//  QuestionData.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/5/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation

//enum type to type for responetype
enum ResponseType {
    case single , multiple , ranged
}
//struct queestion for database
struct Question{
    var text : String
    var type : ResponseType
    var answers : [Answer]
    init(text : String , type : ResponseType , answers : [Answer]) {
        self.answers = answers
        self.type = type
        self.text = text
    }

}
