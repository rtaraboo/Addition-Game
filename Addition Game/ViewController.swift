//
//  ViewController.swift
//  Addition Game
//
//  Created by Rosario Tarabocchia on 9/22/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblTotalCorrect: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    
    @IBOutlet weak var lblTotalIncorrect: UILabel!
    
    @IBOutlet weak var btnAnswer0: UIButton!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    var firstNumber : Int = 0
    var secondNumber : Int = 0
    var answer : Int = 0
    
    var totalCorrect : Int = 0
    var totalIncorrect : Int = 0
    var correctIncorrect = ""
    
    var buttonRandom : Int = 0
    
    var incorrectAnswer1 : Int = 0
    var incorrectAnswer2 : Int = 0
    var incorrectAnswer3 : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeTheNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAnswer0ACTION(sender: UIButton) {
        if buttonRandom == 0 {
            button0Correct()
        }else if buttonRandom != 0{
            incorrectAnswerVOID()
        }
        

    }
    
    
    
    @IBAction func btnAnswer1ACTION(sender: UIButton) {
        if buttonRandom == 1 {
            button1Correct()
        }else if buttonRandom != 1{
            incorrectAnswerVOID()
        }
        
  
    }
    
    
    
    @IBAction func btnAnswer2ACTION(sender: UIButton) {
        
        if buttonRandom == 2 {
            button2Correct()
        }else if buttonRandom != 2{
            incorrectAnswerVOID()
        }
        
    }
    
    
    
    @IBAction func btnAnswer3ACTION(sender: UIButton) {
        if buttonRandom == 3 {
            button3Correct()
        }else if buttonRandom != 3{
            incorrectAnswerVOID()
        }
        
    
    }
    
    
    
    @IBAction func btnResetACTION(sender: UIButton) {
        
        resetGame()
    
    }
    
    
    func randomizeTheNumber(){
        
        firstNumber = Int(arc4random_uniform(1000))
        secondNumber = Int(arc4random_uniform(1000))
        answer = firstNumber + secondNumber
        
        
        buttonRandom = Int(arc4random_uniform(4))
        
        incorrectAnswer3 = Int(arc4random_uniform(2000))
        incorrectAnswer2 = Int(arc4random_uniform(2000))
        incorrectAnswer1 = Int(arc4random_uniform(2000))
        
        
        randomNumberChecks()
        
        
        printButtonText()
        printTheQuestion()
        
        
    }
    
    func printTheQuestion(){
        lblQuestion.text = "\(firstNumber) + \(secondNumber) = ?"
        
    }
    
    func randomNumberChecks(){
        
        if answer == incorrectAnswer3 || answer == incorrectAnswer2 || answer == incorrectAnswer1 || incorrectAnswer1 == incorrectAnswer2 || incorrectAnswer1 == incorrectAnswer3 || incorrectAnswer2 == incorrectAnswer3{
            incorrectAnswer3 = Int(arc4random_uniform(2000))
            incorrectAnswer2 = Int(arc4random_uniform(2000))
            incorrectAnswer1 = Int(arc4random_uniform(2000))
            
        }
        
        
        
    }
    
    
    func printButtonText(){
        
        if buttonRandom == 0 {
            btnAnswer0.setTitle("\(answer)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
        }
        
        if buttonRandom == 1 {
            btnAnswer1.setTitle("\(answer)", forState: UIControlState.Normal)
            btnAnswer0.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
        }
        
        if buttonRandom == 2 {
            btnAnswer2.setTitle("\(answer)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
            btnAnswer0.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
            btnAnswer3.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
        }
        
        if buttonRandom == 3 {
            btnAnswer3.setTitle("\(answer)", forState: UIControlState.Normal)
            btnAnswer1.setTitle("\(incorrectAnswer1)", forState: UIControlState.Normal)
            btnAnswer2.setTitle("\(incorrectAnswer2)", forState: UIControlState.Normal)
            btnAnswer0.setTitle("\(incorrectAnswer3)", forState: UIControlState.Normal)
        }
        
        
        
        
    }
    
    func incorrectAnswerVOID(){
        totalIncorrect = totalIncorrect + 1
        lblTotalIncorrect.text = "Total Incorrect: \(totalIncorrect)"
        correctIncorrect = "Incorrect"
        printCorrectIncorrect()
        
    }
    
    
    func button0Correct(){
        
        correctLogic()
        printCorrectIncorrect()

        
    }
    
    func button1Correct(){
        
        correctLogic()
        printCorrectIncorrect()
        
    }
    
    func button2Correct(){
        
        correctLogic()
        printCorrectIncorrect()
        
    }
    
    func button3Correct(){
        
        correctLogic()
        printCorrectIncorrect()
        
    }
    
    func correctLogic(){
        
        totalCorrect = totalCorrect + 1
        correctIncorrect = "Correct"
    
    }
    
    func printCorrectIncorrect() {
        
        lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        
        reset()
        
        
    }
    
    func reset(){
        
        randomizeTheNumber()
    }
    
    func resetGame(){
        
        totalCorrect = 0
        lblTotalCorrect.text = "Total Correct: \(totalCorrect)"
        
        totalIncorrect = 0
        lblTotalIncorrect.text = "Total Incorrect: \(totalIncorrect)"
        
        lblCorrectIncorrect.text = "Correct / Incorrect"
        
        randomizeTheNumber()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

