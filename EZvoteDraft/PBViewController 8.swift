//
//  PBViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class PBViewController: UIViewController {
    
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
             
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
             tableView.register(MCDropCell.self, forCellReuseIdentifier: "cell")

             tableView.delegate = self
             tableView.dataSource = self

         }
         
     
    @IBAction func startPB(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PB") as! PBPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
 
         //edit words for health care here
         let data = [
                 MCDropData(title: "Biden's View", url: "•Biden claims that President Trump is part of the issue of racism in our country. •He claims this division of races is one that he will seek to fix. •Biden called for police reforms, including a national ban on choke holds to disable a suspect."),
                 MCDropData(title: "Trump's View", url: "•Trump feels that as a country we have to work together to confront bigotry and prejudice wherever they appear. •But we'll make no progress and heal no wounds by falsely labelling tens of millions of decent Americans as racist or bigots. Trump claims  that we must invest more energy and resources in police training and recruiting and community engagement. We have to respect our police.")

             ]
             
             var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


         }

       


         extension PBViewController: UITableViewDelegate, UITableViewDataSource {
             
             func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                 if selectedIndex == indexPath { return 200 }
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
