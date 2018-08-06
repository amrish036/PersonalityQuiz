//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Amrish Mahesh on 5/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

  var responses: [Answer]!
  
  @IBOutlet weak var resultsDefinitionLabel: UILabel!
  @IBOutlet weak var resultsAnswerLabel: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      calculatePersonlityResult()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func calculatePersonlityResult(){
    var frequencyOfAnswers: [AnimalType: Int] = [:]
    let responseTypes = responses.map {$0.type}
    
    for response in responseTypes{
      frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0 ) + 1
    }
    
    let frequencyAnswersSorted = frequencyOfAnswers.sorted(by: {
      (pair1, pair2) -> Bool in
      return pair1.value > pair2.value
    })
    
    let mostCommonAnswer = frequencyAnswersSorted.first!.key
    
    resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultsDefinitionLabel.text = mostCommonAnswer.definition
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
