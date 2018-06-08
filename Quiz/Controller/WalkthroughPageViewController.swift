//
//  WalkthroughPageViewController.swift
//  Quiz
//
//  Created by Anna on 29.05.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageImages = ["sky_tower_photo", "piwnica", "krasnale", "hala_ludowa", "gitarowy-rekord-guinnessa"]
    
    var pageInformations = ["Sky Tower jest najwyższym budynkiem mieszkalnym w Polsce (212 m)", "We Wrocławiu możemy zjeść w najstarszej restauracji w Europie – Piwnica Świdnicka. Restauracja powstała 730 lat temu w centrum, a jadali tutaj Słowacki, Chopin, czy Goethe.", "Na ulicach Wrocławia można zobaczyć ponad 120 krasnoludków. Akcja została zainicjowana poprzez postawienie w 2001 roku na rogu Świdnickiej, jako symbolu Pomarańczowej Alternatywy. Od tego czasu co jakiś czas na ulicach miasta pojawiały się nowe figury.", "Wrocławska Hala Ludowa jest jednym z pierwszych na świecie tak olbrzymich budynków wykonanych z żelbetu. Hala znalazła się dzięki temu na liście UNESCO.", "W tym roku (2018) ustanowiony został nowy rekord Guinnessa w liczbie gitarzystów wykonujących jednocześnie utwór Jimiego Hendrixa. Utwór “Hey Joe” grało jednocześnie 7411 gitarzystów."]
    
    var pageImages2 = ["sky_tower2", "piwnica2", "krasnale2", "hala_ludowa2", "gitara2"]
    
    var pageInformations2 = ["Najwyższy budynek w Polsce ma 212 m i znajduje się we Wrocławiu", "We Wrocławiu możemy zjeść w najstarszej restauracji w Europie – Piwnica Świdnicka.", "Na ulicach Wrocławia można zobaczyć ponad 120 krasnoludków.", "Wrocławska Hala Ludowa jest jednym z pierwszych na świecie tak olbrzymich budynków wykonanych z żelbetu. Hala znalazła się dzięki temu na liście UNESCO. Inna nazwa tej hali to Hala Stulecia.", "Co roku we Wrocławiu podczas majówki odbywa się bicie rekordu Guinnessa w liczbie gitarzystów wykonujących jednocześnie utwór Jimiego Hendrixa. W tym roku utwór “Hey Joe” grało jednocześnie 7411 gitarzystów - udało się pobić wcześniejszy rekord!."]
    
    var currentIndex = 0
    
    var badAnswers = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        // create first lesson with index 0
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageInformations.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        let storyboard = UIStoryboard(name: "Lessons", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController
        {
            if(badAnswers[index]) {
                pageContentViewController.imageFile = pageImages2[index]
                pageContentViewController.informations = pageInformations2[index]
                pageContentViewController.index = index
                
            } else {
                pageContentViewController.imageFile = pageImages[index]
                pageContentViewController.informations = pageInformations[index]
                pageContentViewController.index = index
            }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
