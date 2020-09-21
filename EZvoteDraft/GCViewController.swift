//
//  GCViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class GCViewController: UIViewController {
   
    
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
    
    @IBAction func showGC(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GCpopup") as! GCPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
    
    //edit words for gun control here
    let data = [
            MCDropData(title: "Biden's View", url: "• Regarding gun policy, Biden has a plan that he feels will keep danger off our streets: hold gun manufacturers accountable and get war weapons off the street. \n • He will begin a buyback program for individuals to sell their assault weapons to the government or register them under the NFA."),
            MCDropData(title: "Trump's View", url: "• Trump supports Comprehensive Background Checks to ensure only fit people own guns. \n • He feels that teachers should be allowed to carry guns at school for safety. \n • He plans to raise the age to twenty-one and ban Bump Stocks.")
        ]
        
        var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


    }

  


    extension GCViewController: UITableViewDelegate, UITableViewDataSource {
        
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
