//
//  ViewController.swift
//  PersonalityQuez
//
//  Created by Dũng Võ on 2/4/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindToResultsFromIntroduction(seque : UIStoryboardSegue){
        print("unwind to introduction view controller")
    }


}

