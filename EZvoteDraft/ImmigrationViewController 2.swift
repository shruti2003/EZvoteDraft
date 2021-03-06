//
//  ImmigrationViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class ImmigrationViewController: UIViewController {
   
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


    @IBAction func showImmigration(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "immigration") as! ImmigrationPopUpViewController
                
                self.addChild(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
            }
            
            let data = [
                MCDropData(title: "Biden's View", url: "• Implement effective border screening \n • Reassert America’s commitment to asylum seekers and refugees \n • Protect Dreamers and their families. Biden will remove the uncertainty for Dreamers by reinstating the DACA program, and he will protect their families"),
                MCDropData(title: "Trump's View", url: "\n • Secure the border: Committed to constructing a border wall and ensuring the swift removal of unlawful entrants \n • Supports ending chain migration and eliminating the VISA lottery which is a lottery system to enter the US")
            ]
            
            var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


        }


    
   
            
   


    extension ImmigrationViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if selectedIndex == indexPath { return 400 }
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
