//
//  ViewController.swift
//  Pokedex
//
//  Created by J. Lozano on 11/6/18.
//  Copyright © 2018 J. Lozano All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon = Pokemon()
    var pokeArray = ["Bulbasaur",
                     "Pikachu",
                     "Snorlax",
                     "Wigglytuff",
                     "Charmander"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        pokemon.getPokemon() {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.pokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pokemon.pokeArray[indexPath.row].name
        return cell
    }
}
