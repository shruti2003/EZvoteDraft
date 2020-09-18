//
//  EducationViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {
    
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
      
   

    @IBAction func showEd(_ sender: Any) {
        
        let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EDpopID") as! educationPopUpViewController
        
        self.addChild(gcPopUp)
        gcPopUp.view.frame = self.view.frame
        self.view.addSubview(gcPopUp.view)
        gcPopUp.didMove(toParent: self)
    }
}




//edit words for education here
let edudata = [
    MCDropData(title: "Biden's View", url: "• Provide two years of community college tuition-free for hard-working students.\n • Make public colleges and universities tuition-free for all families with incomes below $125,000 \n • Biden's education plan calls for fully funding individuals with Disabilities"),
    MCDropData(title: "Trump's View", url: "• Supports public money for private schools \n •  Tries to cut funding on education every year\n •  Trump does not support Common Core standards and feels education should be handled at state and local levels, not nationally.")
          ]
          
          var selectedEduIndex: IndexPath = IndexPath(row: 0, section: 0)


    


      extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
          
          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              if selectedEduIndex == indexPath { return 400 }
              return 60
          }
          
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return edudata.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MCDropCell
              cell.data = edudata[indexPath.row]
              cell.selectionStyle = .none
              cell.animate()
              return cell
          }
          
          func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              selectedEduIndex = indexPath
              
              tableView.beginUpdates()
              tableView.reloadRows(at: [selectedEduIndex], with: .none)
              tableView.endUpdates()
          }
          
          
          
          
      }
