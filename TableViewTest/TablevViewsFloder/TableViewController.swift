//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Indhu Arivalagan on 28/02/2020.
//  Copyright © 2020 Indhu Arivalagan. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let service = APIService()
    var array: [Result]?
    
    var selectedTeams : Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        service.fetchUsers { (team) in
            self.array = team.results
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
           
        }
    }

    func reloadTable(users: [Result]) {
        array = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailViewController = segue.destination as? DetailViewController else {
         return
        }
        
        detailViewController.team = selectedTeams
        
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array?.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamUserViewCell", for: indexPath) as? TeamUserViewCell else {
            return UITableViewCell()
        }
        
        guard let user = array? [indexPath.row] else{
            return UITableViewCell()
        }
        cell.genderLabel.text = user.gender.rawValue
        cell.nameLabel.text = "\(user.name.lowercased())"
        cell.ImageView.sd_setImage(with: URL(string: user.image ) , placeholderImage: nil)
        
           
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = array? [indexPath.row] else{ return }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        vc.team = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
