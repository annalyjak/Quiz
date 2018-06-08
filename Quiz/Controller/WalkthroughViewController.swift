//
//  WalkthroughViewController.swift
//  Quiz
//
//  Created by Anna on 29.05.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl! {
        didSet {
            pageControl.numberOfPages = 5
        }
    }
    @IBOutlet var startTestButton: UIButton! {
        didSet {
            startTestButton.isHidden = true
        }
    }
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var badAnswers = [false, false, false, false, false]
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
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
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.badAnswers = badAnswers
        }
    }
    
    @IBAction func startTestButtonTapped(sender: UIButton) {
      //  dismiss(animated: true, completion: nil)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Question", bundle: nil)
        if let questionsViewController = storyBoard.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController {
            present(questionsViewController, animated: true, completion: nil)
            print("hsefgdyu")
        }
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...3:
                walkthroughPageViewController?.forwardPage()
            case 4:
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        updateUI()
    }
    
    @IBAction func previousButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 1...4:
                walkthroughPageViewController?.backwardPage()
            //case 0:
                // do nothing
            default: break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case  0:
                nextButton.isHidden = false
                previousButton.isHidden = true
                startTestButton.isHidden = true
            case 1...3:
                nextButton.isHidden = false
                previousButton.isHidden = false
                startTestButton.isHidden = true
            case 4:
                nextButton.isHidden = true
                previousButton.isHidden = false
                startTestButton.isHidden = false
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
