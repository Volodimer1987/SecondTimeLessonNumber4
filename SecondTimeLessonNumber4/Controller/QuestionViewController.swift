//
//  QuestionViewController.swift
//  SecondTimeLessonNumber4
//
//  Created by vladimir gennadievich on 20.08.2020.
//  Copyright © 2020 Vladimir Gennadievich. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    // MARK: IB Outlets
    
    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singlButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressVIew: UIProgressView!
    
    // MARK - Private Properties
    
    private let questions = Question.getQuestions()
    private var questinIndex = 0
    private var answersChosen:[Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    @IBAction func singlAnswerButtomPressed(_ sender:UIButton) {
        let currentAnswers = questions[questinIndex].answers
        guard let currentIndex = singlButtons.firstIndex(of:sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    @IBAction func multipleAnswerButtomPressed() {
        let currentAnswers = questions[questinIndex].answers
        for (multipleSwitch,answer) in zip(multipleSwitches,currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    @IBAction func rangeAnswerButtomPressed() {
        let currentAnswers = questions[questinIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
  // MARK - private methods
    
  // MARK - update user interface
    
    private func updateUI() {
        
        // hide all stackViews
        
        for stackView in [singleStackView,multipleStackView,rangeStackView] { stackView?.isHidden = true }
        
        // get current Questions
        let currentQuestions = questions[questinIndex]
        

        // culculate progress
        let totalProgress = Float(questinIndex) / Float (questions.count)
        questionProgressVIew.setProgress(totalProgress , animated: true)
        
      // set progress for question progress view
        questionLabel.text = currentQuestions.text

  
        // set navigation title
        title = "Вопрос № \(questinIndex + 1) из \(questions.count)"
        
        let currentAnswers = currentQuestions.answers
        // show stack view corresponding to question type
        
        switch currentQuestions.type  {
        case .single:
             updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangeStackView(using: currentAnswers)

        }
    }
    
    
    private func updateSingleStackView(using answers:[Answer]) {
        // show single stack view
        
        singleStackView.isHidden = false
        
        for (text,buttons) in zip(answers, singlButtons) {
            buttons.setTitle(text.text, for: .normal)
        }
    }
    
    private func updateMultipleStackView(using  answers:[Answer]) {
     
        multipleStackView.isHidden = false
        
        for (label,answer) in zip(multipleLabels,answers) {
            label.text = answer.text
        }
        
    }
    
    private func updateRangeStackView(using  answers:[Answer]) {
        
        rangeStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        
    }
    private func nextQuestion() {
        // show next question or go too the next screen
        questinIndex += 1
        
        if questinIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChosen
    }
}

