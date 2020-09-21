//
//  GCViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class GCViewController: UIViewController {
    
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
    
    @IBAction func showGC(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GCpopup") as! GCPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
    
    //edit words for gun control here
    let data = [
            MCDropData(title: "Biden's View", url: "•Buyback program for individuals to sell their assault weapons to the government •In favor of universal background checks •Individuals need grants to obtain a license prior to purchasing a gun."),
            MCDropData(title: "Trump's View", url: "• Promotes a concealed carry permit • Believes that the government should not control what type of firearms citizens should have access to • Emphasis on Mental Health for background checks")
        ]
        
        var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


    }

  


    extension GCViewController: UITableViewDelegate, UITableViewDataSource {
        
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
