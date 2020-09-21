//
//  LGBTQViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class LGBTQViewController: UIViewController {
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
          
      
    @IBAction func startLGBTQ(_ sender: Any) {
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LGBTQ+") as! LGBTQPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
  
     
          //edit words for health care here
          let data = [
                  MCDropData(title: "Biden's View", url: "• Biden considers himself pro-LGBTQ+ rights. \n • Although he voted in favor of the Defense of Marriage Act in 1996, he will make the Equality Act a priority in his first 100 days in office. \n • He will ensure equality for these people in the job market, the criminal justice system, and on the healthcare circuit."),
                  MCDropData(title: "Trump's View", url: "• Trump considers himself pro-LGBTQ+. \n • Pledges to decriminalize LGBTQ+, change the ban on donating blood, and end the HIV/AIDS epidemic by 2030. \n • Opposes the Equality Act and feels it undermines parental rights. \n • Has policy that bans openly trans people from serving in the military.")
              ]
              
              var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)


          }

        


          extension LGBTQViewController: UITableViewDelegate, UITableViewDataSource {
              
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
