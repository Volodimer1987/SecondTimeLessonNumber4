//
//  ResultsViewController.swift
//  SecondTimeLessonNumber4
//
//  Created by vladimir gennadievich on 20.08.2020.
//  Copyright © 2020 Vladimir Gennadievich. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
  
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDifenitionLabel: UILabel!
    
    var responses:[Answer]!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        updateResult()
      }
      
     private func updateResult() {
        
        var answerAnimalType = [AnimalType:Int]()
        let animals = responses.map{$0.type}
        
        for animal in animals {
            answerAnimalType[animal] = (answerAnimalType[animal] ?? 0) + 1
      }
        
        let sortedAnswerAnimals = answerAnimalType.sorted { $0.value > $1.value }
        
        guard let mostAnimal = sortedAnswerAnimals.first?.key else {return}
        
        updateUI(with: mostAnimal)
    }
    
    private func updateUI(with animal:AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDifenitionLabel.text = "\(animal.definition)"
    }
}
