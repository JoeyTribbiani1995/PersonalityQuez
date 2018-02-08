//
//  QuestionsiewController.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/4/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatabase()
        print("create a database")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        print("update UI")
      
    }
    //create a question
    var questions : [Question] = []
    var questionIndex : Int = 0
    var answersChosen : [Answer] = []
    //outlet
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    //action single stack view when press each button
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
       
        }
        nextQuestions()
     
    }
    //action multipe stack view when turn swtich
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswer[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswer[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswer[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswer[3])
        }
        nextQuestions()
    }
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswer.count - 1 )))
        answersChosen.append(currentAnswer[index])
        nextQuestions()
    }
    
    
    
    
    //func create a database
    func createDatabase(){
        let answerSteak = Answer(text: "Steak", type: .dog)
        let answerFish = Answer(text: "Fish", type: .cat)
        let answerCarrots = Answer(text: "Carrots", type: .rabbit)
        let answerCorn = Answer(text: "Corn", type: .turtle)
        
        let answerSwim = Answer(text: "Swimming", type: .turtle)
        let answerSlep = Answer(text: "Sleping", type: .cat)
        let answerCud = Answer(text: "Cuddling", type: .rabbit)
        let answerEat = Answer(text: "Eating", type: .dog)
        
        let answerDis = Answer(text: "I dislike them", type: .cat)
        let answerGet = Answer(text: "i get a little nervous", type: .rabbit)
        let answerBare = Answer(text: "i barely notice them", type: .turtle)
        let answerLove = Answer(text: "i love them", type: .dog)
        
        var answer1 : [Answer] = []
        var answer2 : [Answer] = []
        var answer3 : [Answer] = []
        
        answer1.append(answerFish)
        answer1.append(answerSteak)
        answer1.append(answerCarrots)
        answer1.append(answerCorn)
        
        answer2.append(answerSwim)
        answer2.append(answerSlep)
        answer2.append(answerCud)
        answer2.append(answerEat)
        
        answer3.append(answerDis)
        answer3.append(answerBare)
        answer3.append(answerLove)
        answer3.append(answerGet)
        
        let ques1 = Question(text: "Which food do you like the most ?", type: .single, answers: answer1)
        let ques2 = Question(text: "Which activities do you enjoy ?", type: .multiple, answers: answer2)
        let ques3 = Question(text: "How much do you enjoy car rides ", type: .ranged, answers: answer3)
        
        questions.append(ques1)
        questions.append(ques2)
        questions.append(ques3)
    }
    //func updateUI
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
        case .single:
           updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiple(using: currentAnswers)
        case .ranged:
            updateRanged(using: currentAnswers)
        }
    }
    //func update single stack view to UI
    func updateSingleStack(using answers : [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    //func update multiple stack view to UI
    func updateMultiple(using answers : [Answer]) {
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    //func update ranged stack view to UI
    func updateRanged(using answers : [Answer]){
        rangeStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangeLabel2.text = answers.last?.text
    }
    //func next stack view to UI
    func nextQuestions() {
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "ResultsSeque", sender: nil)
        }
    }
    //func pass information to Results view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSeque"  {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }

    
    
    
}
