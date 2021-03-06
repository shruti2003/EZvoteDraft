//
//  PBViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class PBViewController: UIViewController {
    
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
         
     
    @IBAction func startPB(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PB") as! PBPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
 
         //edit words for health care here
         let data = [
                 MCDropData(title: "Biden's View", url: "• Biden claims the division of races is one that he will seek to fix, and admits racism is an ongoing issue. \n • He called for police reforms, including a national ban on chokeholds to disable a suspect. \n• Biden encourages the peaceful protests on race issues, and feels violence is not helpful to any cause."),
                 MCDropData(title: "Trump's View", url: "• Trump feels that as a country we have to work together to confront bigotry, but we will make no progress by falsely labelling Americans as racist or bigots. \n • Trump claims that we must invest more energy and resources in police training. \n • He feels that we have to respect our police because they are protecting us.")

             ]
             
             var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


         }

       


         extension PBViewController: UITableViewDelegate, UITableViewDataSource {
             
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
