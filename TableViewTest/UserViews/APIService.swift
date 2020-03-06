//
//  APIService.swift
//  TableViewTest
//
//  Created by Indhu Arivalagan on 28/02/2020.
//  Copyright © 2020 Indhu Arivalagan. All rights reserved.
//

import Foundation

class APIService {
    var persons :Welcome?
    let rickArray = [""]
    
    
    let urlString: String = "https://rickandmortyapi.com/api/character"
   
    func fetchUsers(completionHandler: @escaping(Welcome) -> Void){
        
            let finalString:String =  urlString
            
           
            guard let url = URL(string: finalString) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data, let team = try?
                JSONDecoder().decode(Welcome.self, from: data) {

                    completionHandler(team)
                }
                

            })
            task.resume()
//        }
    }

}
