//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Anna on 08.06.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl! {
        didSet {
            pageControl.numberOfPages = 5
        }
    }
    @IBOutlet var stopTestButton: UIButton! {
        didSet {
            //stopTestButton.layer.cornerRadius = 25.0
            //stopTestButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var previousButton: UIButton!{
        didSet{
            previousButton.isHidden=true
        }
    }
    @IBOutlet var nextButton: UIButton!
    
    var questionsPageViewController: QuestionsPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? QuestionsPageViewController {
            questionsPageViewController = pageViewController
        }
    }
    
    @IBAction func stopTestButtonTapped(sender: UIButton) {
        questionsPageViewController?.stopTest()
        updateUI()
        if(questionsPageViewController?.IS_TEST_MODE == false) {
            stopTestButton.setTitle("Ucz się od nowa", for: .normal)
        }
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = questionsPageViewController?.currentIndex {
            switch index {
            case 0...3:
                questionsPageViewController?.forwardPage()
            case 4:
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        updateUI()
    }
    
    @IBAction func previousButtonTapped(sender: UIButton) {
        if let index = questionsPageViewController?.currentIndex {
            switch index {
            case 1...4:
                questionsPageViewController?.backwardPage()
                //case 0:
            // do nothing
            default: break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = questionsPageViewController?.currentIndex {
            switch index {
            case  0:
                nextButton.isHidden = false
                previousButton.isHidden = true
              //  startTestButton.isHidden = true
            case 1...3:
                nextButton.isHidden = false
                previousButton.isHidden = false
              //  startTestButton.isHidden = true
            case 4:
                nextButton.isHidden = true
                previousButton.isHidden = false
              //  startTestButton.isHidden = false
            default: break
            }
            pageControl.currentPage = index
        }
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
