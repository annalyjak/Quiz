//
//  ViewController.swift
//  Quiz
//
//  Created by Anna on 28.05.2018.
//  Copyright © 2018 PWR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startLessonsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "showInformation" {
          //  let destinationController = segue.destination as! InformationViewController
           // destinationController.information = informations[1]
        //}
    }
    
    @IBAction func startLessonsButtonTapped(sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Lessons", bundle: nil)
        if let walkthroughViewController = storyBoard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            present(walkthroughViewController, animated: true, completion: nil)
        }
        //        dismiss(animated: true, completion: nil)
    }
    


}

