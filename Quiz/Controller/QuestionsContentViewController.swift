//
//  QuestionsContentViewController.swift
//  Quiz
//
//  Created by Anna on 06.06.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class QuestionsContentViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel! {
        didSet {
            questionLabel.numberOfLines = 0
        }
    }
    @IBOutlet var firstQuestionButton: UIButton!
    @IBOutlet var secondQuestionButton: UIButton!
    @IBOutlet var thirdQuestionButton: UIButton!
    @IBOutlet var fourthQuestionButton: UIButton!
    
    @IBOutlet var questionBigImageView: UIImageView!
    
    @IBOutlet var firstCorrectImageView: UIImageView! {
        didSet{
            firstCorrectImageView.isHidden = true
        }
    }
    @IBOutlet var secondCorrectImageView: UIImageView! {
        didSet{
            secondCorrectImageView.isHidden = true
        }
    }
    @IBOutlet var thirdCorrectImageView: UIImageView! {
        didSet{
            thirdCorrectImageView.isHidden = true
        }
    }
    @IBOutlet var fourthCorrectImageView: UIImageView! {
        didSet{
            fourthCorrectImageView.isHidden = true
        }
    }
    
    @IBOutlet var firstErrorImageView: UIImageView! {
        didSet {
            firstErrorImageView.isHidden = true
        }
    }
    @IBOutlet var secondErrorImageView: UIImageView!  {
        didSet {
            secondErrorImageView.isHidden = true
        }
    }
    @IBOutlet var thirdErrorImageView: UIImageView!  {
        didSet {
            thirdErrorImageView.isHidden = true
        }
    }
    @IBOutlet var fourthErrorImageView: UIImageView!  {
        didSet {
            fourthErrorImageView.isHidden = true
        }
    }
    
    var index = 0
    var question = ""
    var imageFile = ""
    var IS_TEST_MODE = true
    var firstAndswer: Andswer!
    var secondAndswer: Andswer!
    var thirdAndswer: Andswer!
    var fourthAndswer: Andswer!
    //var andswers = [Andswer.init(), Andswer.init(), Andswer.init(), Andswer.init()]
    
    var questionsPageViewController: QuestionsPageViewController?
    
    
    //580 str
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = question
        firstQuestionButton.setTitle(firstAndswer.contet, for: .normal)
        secondQuestionButton.setTitle(secondAndswer.contet, for: .normal)
        thirdQuestionButton.setTitle(thirdAndswer.contet, for: .normal)
        fourthQuestionButton.setTitle(fourthAndswer.contet, for: .normal)
        if (!IS_TEST_MODE){
            setAllImages()
        }
        setSelected()
        questionBigImageView.image = UIImage(named: imageFile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAllImages() {
        if(firstAndswer.isCorret){
            firstCorrectImageView.isHidden = false
        } else {
            if(firstAndswer.isSelected) {
                firstErrorImageView.isHidden = false
            }
        }
        if(secondAndswer.isCorret){
            secondCorrectImageView.isHidden = false
        } else {
            if(secondAndswer.isSelected) {
                secondErrorImageView.isHidden = false
            }
        }
        if(thirdAndswer.isCorret){
            thirdCorrectImageView.isHidden = false
        } else {
            if(thirdAndswer.isSelected) {
                thirdErrorImageView.isHidden = false
            }
        }
        if(fourthAndswer.isCorret){
            fourthCorrectImageView.isHidden = false
        } else {
            if(fourthAndswer.isSelected) {
                fourthErrorImageView.isHidden = false
            }
        }
        firstQuestionButton.isEnabled = false
        secondQuestionButton.isEnabled = false
        thirdQuestionButton.isEnabled = false
        fourthQuestionButton.isEnabled = false
    }
    
    func setSelected() {
        if(firstAndswer.isSelected) {
            firstQuestionButton.setTitleColor(UIColor.magenta, for: [])
        } else {
            firstQuestionButton.setTitleColor(UIColor.black, for: [])
        }
        if(secondAndswer.isSelected) {
            secondQuestionButton.setTitleColor(UIColor.magenta, for: [])
        } else {
            secondQuestionButton.setTitleColor(UIColor.black, for: [])
        }
        if(thirdAndswer.isSelected) {
            thirdQuestionButton.setTitleColor(UIColor.magenta, for: [])
        } else {
            thirdQuestionButton.setTitleColor(UIColor.black, for: [])
        }
        if(fourthAndswer.isSelected) {
            fourthQuestionButton.setTitleColor(UIColor.magenta, for: [])
        } else {
            fourthQuestionButton.setTitleColor(UIColor.black, for: [])
        }
        
    }
    
    @IBAction func firstAnswerButtonTapped(sender: UIButton) {
        firstAndswer.isSelected = true
        secondAndswer.isSelected = false
        thirdAndswer.isSelected = false
        fourthAndswer.isSelected = false
        setSelected()
    }

    @IBAction func secondAnswerButtonTapped(sender: UIButton) {
        firstAndswer.isSelected = false
        secondAndswer.isSelected = true
        thirdAndswer.isSelected = false
        fourthAndswer.isSelected = false
        setSelected()
    }

    @IBAction func thirdAnswerButtonTapped(sender: UIButton) {
        firstAndswer.isSelected = false
        secondAndswer.isSelected = false
        thirdAndswer.isSelected = true
        fourthAndswer.isSelected = false
        setSelected()
    }

    @IBAction func fourthAnswerButtonTapped(sender: UIButton) {
        firstAndswer.isSelected = false
        secondAndswer.isSelected = false
        thirdAndswer.isSelected = false
        fourthAndswer.isSelected = true
        setSelected()
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
