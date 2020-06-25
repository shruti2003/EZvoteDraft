//
//  AborViewController.swift
//  EZvoteDraft
//
//  Created by shruti on 6/24/20.
//  Copyright © 2020 Shruti Patel. All rights reserved.
//

import UIKit

class AborViewController: UIViewController {

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
          
       
  
        @IBAction func showAbortion(_ sender: Any) {
            let gcPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AbortionPopID") as! AborPopUpViewController
            
            self.addChild(gcPopUp)
                                                      gcPopUp.view.frame = self.view.frame
                                                      self.view.addSubview(gcPopUp.view)
                                                      gcPopUp.didMove(toParent: self)
                         
            }
        }
        
                                                              
        
          //edit words for education here
          let abortdata = [
                  MCDropData(title: "Biden's View", url: "•Provide two years of community college tuition-free for hard-working students. •Make public colleges and universities tuition-free for all families with incomes below $125,000."),
                  MCDropData(title: "Trump's View", url: "• Promotes a concealed carry permit • Believes that the government should not control what type of firearms citizens should have access to • Emphasis on Mental Health for background checks")
              ]
              
              var selectedAbortIndex: IndexPath = IndexPath(row: 0, section: 0)


        


          extension AborViewController: UITableViewDelegate, UITableViewDataSource {
              
              func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  if selectedAbortIndex == indexPath { return 200 }
                  return 60
              }
              
              func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                  return abortdata.count
              }
              
              func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MCDropCell
                  cell.data = abortdata[indexPath.row]
                  cell.selectionStyle = .none
                  cell.animate()
                  return cell
              }
              
              func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                  selectedAbortIndex = indexPath
                  
                  tableView.beginUpdates()
                  tableView.reloadRows(at: [selectedAbortIndex], with: .none)
                  tableView.endUpdates()
              }
              
              
              
              
          }
