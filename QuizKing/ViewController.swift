//
//  ViewController.swift
//  QuizKing
//
//  Created by student on 2019/5/24.
//  Copyright © 2019年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: UIButton) {
        self.performSegue(withIdentifier: "selectLevelSegue", sender: self)
    }
    
}

