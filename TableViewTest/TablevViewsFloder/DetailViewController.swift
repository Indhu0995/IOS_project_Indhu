//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by Indhu Arivalagan on 28/02/2020.
//  Copyright © 2020 Indhu Arivalagan. All rights reserved.//

import UIKit

class DetailViewController: UIViewController {
    
    var team : Result?
   
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var namelablel: UILabel!
    @IBOutlet weak var genderLablel: UILabel!
    @IBOutlet weak var statusLablel: UILabel!
    @IBOutlet weak var speciesCodeLablel: UILabel!
    @IBOutlet weak var locationLablel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        populateInfo()
    }
    
    func populateInfo() {
        guard team != nil else {
            return
        }
        personImage.sd_setImage(with: URL(string: team?.image ?? ""), placeholderImage: nil)
        namelablel.text = team?.name
        genderLablel.text = team?.gender.rawValue
        statusLablel.text = team?.status.rawValue
        speciesCodeLablel.text = team?.species.rawValue
        locationLablel.text = team?.location.name
        
        
    }
    
    
}
