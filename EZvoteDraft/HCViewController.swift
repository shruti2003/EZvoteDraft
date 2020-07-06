//
//  HCViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class HCViewController: UIViewController {
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
         
     
    @IBAction func startHC(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Healthcare") as! HCPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
    
         //edit words for health care here
         let data = [
                 MCDropData(title: "Biden's View", url: "• Stop surprise billing \n• Prescription drug reform \n •Plans to create a new Medicare-like public option that revolves around said Act. \n • Every American should be able to have the comfort of knowing they have affordable\n"),
                 MCDropData(title: "Trump's View", url: "• During his term, Trump has increased the availability of short-term plans to provide options that can be up to 60 percent cheaper than Obamacare plans. \n •The Administration’s expansion plans to give millions of Americans more options to select a suitable health plan.")
             ]
             
             var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


         }

       


         extension HCViewController: UITableViewDelegate, UITableViewDataSource {
             
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
