//
//  votingViewController.swift
//  EZvoteDraft
//
//  Created by Gia-Uyen Tran on 6/25/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class votingViewController: UIViewController {

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func votingHub(_ sender: Any) {

    UIApplication.shared.open(URL(string: "https://www.votetexas.gov/index.html")! as URL, options: [:], completionHandler: nil)
    }
    
    
    }
