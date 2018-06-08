//
//  QuestionsPageViewController.swift
//  Quiz
//
//  Created by Anna on 07.06.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class QuestionsPageViewController: UIPageViewController, UIPageViewControllerDataSource {


    var pageImages = ["sky_tower2", "piwnica2", "krasnale2", "hala_ludowa2", "gitara2"]
    
    var questions = [Question.init(contet: "Sky tower to: ", first: Andswer.init(qestionNumber: 1, number: 1, isCorret: true, isSelected: false, contet: "najwyższy budynek w Polsce"), second: Andswer.init(qestionNumber: 1, number: 2, isCorret: false, isSelected: false, contet: "najwyższy budynek na świecie"), third: Andswer.init(qestionNumber: 1, number: 3, isCorret: false, isSelected: false, contet: "budynek z żelbetonu"), fourth: Andswer.init(qestionNumber: 1, number: 4, isCorret: false, isSelected: false, contet: "budynek z najnowszą galerią handlową we Wrocławiu")),                     Question.init(contet: "Piwnica świdnicka to:", first: Andswer.init(qestionNumber: 2, number: 1, isCorret: false, isSelected: false, contet: "zabytek"), second: Andswer.init(qestionNumber: 2, number: 2, isCorret: false, isSelected: false, contet: "zwykla piwnica w Świdnicy"), third: Andswer.init(qestionNumber: 2, number: 3, isCorret: true, isSelected: false, contet: "najstarsza wrocławska restauracja"), fourth: Andswer.init(qestionNumber: 2, number: 4, isCorret: false, isSelected: false, contet: "najstarsza świdnicka restauracja")),                     Question.init(contet: "Wrocław słynie z:", first: Andswer.init(qestionNumber: 3, number: 1, isCorret: false, isSelected: false, contet: "cudownej pogody"), second: Andswer.init(qestionNumber: 3, number: 2, isCorret: false, isSelected: false, contet: "mrówek"), third: Andswer.init(qestionNumber: 3, number: 3, isCorret: false, isSelected: false, contet: "studentów"), fourth: Andswer.init(qestionNumber: 3, number: 4, isCorret: true, isSelected: false, contet: "krasnali")),                     Question.init(contet: "Wrocławski budynek na liscie UNESCO to:", first: Andswer.init(qestionNumber: 4, number: 1, isCorret: true, isSelected: false, contet: "Hala Ludowa"), second: Andswer.init(qestionNumber: 4, number: 2, isCorret: false, isSelected: false, contet: "Hala sportowa"), third: Andswer.init(qestionNumber: 4, number: 3, isCorret: false, isSelected: false, contet: "Fontanna stulecia"), fourth: Andswer.init(qestionNumber: 4, number: 4, isCorret: false, isSelected: false, contet: "Fontanna ludowa")), Question.init(contet: "W tym roku - 2018 - został pobity rekord: ", first: Andswer.init(qestionNumber: 5, number: 1, isCorret: true, isSelected: false, contet:        "gitarowy Guinnessa"), second: Andswer.init(qestionNumber: 5, number: 2, isCorret: false, isSelected: false, contet: "gitarowy Wrocławia"), third: Andswer.init(qestionNumber: 5, number: 3, isCorret: false, isSelected: false, contet: "fletowy Guinnessa"), fourth: Andswer.init(qestionNumber: 5, number: 4, isCorret: false, isSelected: false, contet: "pianistyczny Guinnessa"))]
    
    var currentIndex = 0
    
    var IS_TEST_MODE = true
    
    var tempContentViewController: QuestionsContentViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        // Do any additional setup after loading the view.
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! QuestionsContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! QuestionsContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> QuestionsContentViewController? {
        if index < 0 || index >= questions.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        let storyboard = UIStoryboard(name: "Question", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "QuestionsContentViewController") as? QuestionsContentViewController
        {
            pageContentViewController.IS_TEST_MODE = IS_TEST_MODE
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.index = index
            
            pageContentViewController.question = questions[index].contet
            
            pageContentViewController.firstAndswer = questions[index].first
            pageContentViewController.secondAndswer = questions[index].second
            pageContentViewController.thirdAndswer = questions[index].third
            pageContentViewController.fourthAndswer = questions[index].fourth
            
            pageContentViewController.questionsPageViewController = self
            
            tempContentViewController = pageContentViewController
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func backwardPage() {
        currentIndex -= 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    func stopTest() {
        if (IS_TEST_MODE) {
            IS_TEST_MODE = false
            currentIndex = 0
            if let nextViewController = contentViewController(at: currentIndex) {
                setViewControllers([nextViewController], direction: .reverse, animated: true, completion: nil)
            }
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Lessons", bundle: nil)
            if let walkthroughViewController = storyBoard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
                let tab = [!questions[ 0].isCorrectAndswer(), !questions[1].isCorrectAndswer(), !questions[2].isCorrectAndswer(), !questions[3].isCorrectAndswer(), !questions[4].isCorrectAndswer()]
                walkthroughViewController.badAnswers = tab
                walkthroughViewController.walkthroughPageViewController?.badAnswers = tab
                present(walkthroughViewController, animated: true, completion: nil)
            }
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
