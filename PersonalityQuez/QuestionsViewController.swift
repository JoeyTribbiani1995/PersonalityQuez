//
//  QuestionsiewController.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/4/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class QuestionsiewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //create a question
    var answerSteak = Answer(text: "Steak", type: .dog)
    var answerFish = Answer(text: "Fish", type: .cat)
    var answerCarrots = Answer(text: "Carrots", type: .rabbit)q

    
    
//    var question : [Question] = Question(text: "Which food do you like the most ? ", type: .single, answers: "")
}
