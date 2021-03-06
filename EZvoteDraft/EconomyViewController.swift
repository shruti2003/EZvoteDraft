//
//  EconomyViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class EconomyViewController: UIViewController {

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
         
      

    @IBAction func showEcon(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "econ") as! EconomyPopUpViewController
                                                   
                                                   self.addChild(gcPopUp)
                                                   gcPopUp.view.frame = self.view.frame
                                                   self.view.addSubview(gcPopUp.view)
                                                   gcPopUp.didMove(toParent: self)
                                               }
                }
    
   
       
       
         
       
         //edit words for education here
         let data = [
                 MCDropData(title: "Biden's View", url: "• Biden’s plan for the economy includes that: businesses make arrangements for employees in high-risk groups, funding is given for small businesses, and steps be taken to reopen schools and day-care centers. \n • Biden has guaranteed paid leave for those who get sick."),
                 MCDropData(title: "Trump's View", url: "• Trump has planned a three-phased approach to reopen the economy: Phase one is individuals that are high-risk should continue to shelter in place. Phase two is for people to continue to shelterhowever social settings can restart with no more than fifty people. Phase three is when people can resume public interactions.")
             ]
             
             var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


       


         extension EconomyViewController: UITableViewDelegate, UITableViewDataSource {
             
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
