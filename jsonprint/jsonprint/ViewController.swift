//
//  ViewController.swift
//  jsonprint
//
//  Created by Marc Jesus on 08/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    
    struct Petition: Codable {
        var title: String
        var body: String
        var signatureCount: Int
    }
    
    struct Petitions: Codable {
        var results: [Petition]
    }
    
    var petitions = [Petition]()
    
    private var filename = "test.json"

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let data:Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename)")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't find \(filename)")
        }
        
        let decoder = JSONDecoder()
        let jsonPetitions = try? decoder.decode(Petitions.self, from: data)
        print(jsonPetitions as Any)
        titleLabel.text = "\(jsonPetitions)"
        
        
    }


}

