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
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var firstQuestionButton: UIButton!
    @IBOutlet var secondQuestionButton: UIButton!
    @IBOutlet var thirdQuestionButton: UIButton!
    @IBOutlet var fourthQuestionButton: UIButton!
    
    @IBOutlet var questionBigImageView: UIImageView!
    
    @IBOutlet var firstCorrectImageView: UIImageView! {
        didSet{
            firstCorrectImageView.hidden = true
        }
    }
    @IBOutlet var secondCorrectImageView: UIImageView! {
        didSet{
            secondCorrectImageView.hidden = true
        }
    }
    @IBOutlet var thirdCorrectImageView: UIImageView! {
        didSet{
            thirdCorrectImageView.hidden = true
        }
    }
    @IBOutlet var fourthCorrectImageView: UIImageView! {
        didSet{
            fourthCorrectImageView.hidden = true
        }
    }
    
    @IBOutlet var firstErrorImageView: UIImageView! {
        didSet {
            firstErrorImageView.hidden = true
        }
    }
    @IBOutlet var secondErrorImageView: UIImageView!  {
        didSet {
            secondErrorImageView.hidden = true
        }
    }
    @IBOutlet var thirdErrorImageView: UIImageView!  {
        didSet {
            thirdErrorImageView.hidden = true
        }
    }
    @IBOutlet var fourthErrorImageView: UIImageView!  {
        didSet {
            fourthErrorImageView.hidden = true
        }
    }
    
    var index = 0
    var question = ""
    var imageFile = ""
    var isTest = true
    //var andswers = [Andswer.init(), Andswer.init(), Andswer.init(), Andswer.init()]
    
    
    //580 str
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = question
        firstQuestionButton.text = "1"
        secondQuestionButton.text = "2"
        thirdQuestionButton.text = "3"
        fourthQuestionButton.text = "4"
        questionBigImageView.image = UIImage(named: imageFile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
