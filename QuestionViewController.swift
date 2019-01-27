//
//  QuestionViewController.swift
//  personalityquiz
//
//  Created by freddieRex on 1/23/19.
//  Copyright © 2019 Fredrex Enterprises. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var SingleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    @IBOutlet weak var MultipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var mutltipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleSwitch4: UISwitch!
    
    
    @IBOutlet weak var RangedStackView: UIStackView!
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var rangeSlider: UISlider!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .range,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
            ])
    ]
    
    var questionIndex = 0
    var answerChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
            
        default:
            break
        
        }
        
        nextQuestion()
    }
    
    @IBAction func multiplebuttonpressed() {
        let currentAnswers = questions[questionIndex].answers
        if multipleSwitch1.isOn{
            answerChosen.append(currentAnswers[1])
        }
        if multipleSwitch2.isOn{
            answerChosen.append(currentAnswers[2])
        }
        if multipleSwitch2.isOn{
            answerChosen.append(currentAnswers[3])
        }
        if multipleSwitch2.isOn{
            answerChosen.append(currentAnswers[4])
            
            
        }
        
        nextQuestion()
    }
           
    @IBAction func rangeAnswerButtonPressed() {
       let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    
    
    func updateUI(){
        
        SingleStackView.isHidden = true
        MultipleStackView.isHidden = true
        RangedStackView.isHidden = true
    
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .range:
            updateRangedStack(using: currentAnswers)
        }
        
    }
        func updateSingleStack(using answers: [Answer]) {
            SingleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            MultipleStackView.isHidden = false
            /*MultiSwitch1.isOn = false
            MultiSwitch2.isOn = false
            MultiSwitch3.isOn = false
            MultiSwitch4.isOn = false*/
            multipleLabel1.text = answers[0].text
            mutltipleLabel2.text = answers[1].text
            multipleLabel3.text = answers[2].text
            multipleLabel4.text = answers[3].text
        }
        
        func updateRangedStack(using answers: [Answer]) {
            RangedStackView.isHidden = false
            //RangedSlider.setValue(0.5, animated: false)
            rangeLabel1.text = answers.first?.text
            rangeLabel2.text = answers.last?.text
        }
    
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


