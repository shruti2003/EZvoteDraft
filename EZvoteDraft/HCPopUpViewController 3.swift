//
//  HCPopUpViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class HCPopUpViewController: UIViewController {

    @IBOutlet weak var HC: UITextView!
   
      
      override func viewDidLoad() {
          super.viewDidLoad()
         
          HC.layer.cornerRadius = 10.0
          self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)


          // Do any additional setup after loading the view.
      }
      
    @IBAction func closeHC(_ sender: Any) {
        self.view.removeFromSuperview()
    }
   
      
      func showAnimate()
          {
              self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
              self.view.alpha = 0.0;
              UIView.animate(withDuration: 0.6,delay: 0.3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                  self.view.alpha = 1.0
                  self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                  
                  
                            
              });
          }
          
          func removeAnimate()
          {
              UIView.animate(withDuration: 0.6,delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                  self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                  self.view.alpha = 0.0;
                  }, completion:{(finished : Bool)  in
                      if (finished)
                      {
                          self.view.removeFromSuperview()
                      }
              });
          }

          

      }
