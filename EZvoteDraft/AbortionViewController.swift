//
//  AbortionViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class AbortionViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
        let tableView:UITableView = {
            let tb = UITableView()
            tb.translatesAutoresizingMaskIntoConstraints = false
            return tb
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
                
           // definitionButton.layer.cornerRadius = 10.0
            
            setUpTableView()

        }
        
        fileprivate func setUpTableView(){
            view.addSubview(tableView)
            
            tableView.topAnchor.constraint(equalTo: button.topAnchor, constant: 80).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
            tableView.register(MCDropCell.self, forCellReuseIdentifier: "cell")

            
            tableView.delegate = self
            tableView.dataSource = self

        }


    @IBAction func showAbortion(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Abortion") as! AbortionPopUpViewController
            
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
        
            
        
        let data = [
            MCDropData(title: "Biden's View", url: "• Biden is pro-choice, and is personally opposed to abortion but believes it should be legal. \n • He will give support for women who have abortions.\n • Biden no longer supports the Hyde Amendment.\n • He would restore federal funding for Planned Parenthood."),
            MCDropData(title: "Trump's View", url: "• Trump is a pro-life candidate. \n • Will end research that uses tissue from aborted fetuses. \n • Planned parenthood should be defunded and another program should be made for handling cancer aspects \n • We should ban late term abortions with exceptions for rape, incest or health.")
                ]
        
        var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


    }



    extension AbortionViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if selectedIndex == indexPath { return  400 }
            return 60
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MCDropCell
            cell.data = data[indexPath.row]
            cell.selectionStyle = .none
            cell.animate()
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedIndex = indexPath
            
            tableView.beginUpdates()
            tableView.reloadRows(at: [selectedIndex], with: .none)
            tableView.endUpdates()
        }
        
        
        
        
    }
