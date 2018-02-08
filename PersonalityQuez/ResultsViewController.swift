//
//  ResultsViewController.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/4/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //outlet
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    var responses : [Answer]!
    
    //func calculate
    func calculatePersonalityResult() {
        // dictionary [ key is animaltype : value is Integer ]
        var frequencyOfAnswer : [AnimalType : Int] = [:]
        // get value to responses on question view controller , but i only need type animal not text , i use map get it 
        let responseType = responses.map{$0.type}

        for response in responseType {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        
        }
        //sort
        let frequentAnswerSorted = frequencyOfAnswer.sorted(by: {(pair1 , pair2)-> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        resultAnswerLabel.text = "you are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
  
    }
   

}
