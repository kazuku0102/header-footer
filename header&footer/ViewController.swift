//
//  ViewController.swift
//  header&footer
//
//  Created by 蕭聿莘 on 2020/9/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aTableView: UITableView!
    
    let fruits = [
        ["apple", "banana", "durian",  "plum"],
        ["金", "木", "水", "火", "土"],
        ["🦊"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aTableView.dataSource = self
        aTableView.delegate = self
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: aTableView.frame.width, height: 300 ))
        let footerrView = UIView(frame: CGRect(x: 0, y: 0, width: aTableView.frame.width, height: 100 ))
        
        
        headerView.backgroundColor = .purple
        footerrView.backgroundColor = .blue
        
        aTableView.tableHeaderView = headerView
        aTableView.tableFooterView = footerrView
        
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header\(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 300
        }else{
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.section][indexPath.row]
        cell.backgroundColor = .green
        return cell
    }
    
    
}
