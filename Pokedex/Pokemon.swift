//
//  Pokemon.swift
//  Pokedex
//
//  Created by J. Lozano on 11/6/18.
//  Copyright © 2018 J. Lozano All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    struct PokeData {
        var name: String
        var url: String
    }
    
    var pokeArray: [PokeData] = []
    
    func getPokemon(completed: @escaping () -> ()) {
        let pokemonURL = "https://pokeapi.co/api/v2/pokemon/"
        Alamofire.request(pokemonURL).responseJSON { response in
            print("*** JSON = \(response)")
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numberOfPokemon = json["results"].count
                for index in 0...numberOfPokemon-1 {
                    let name = json["results"][index]["name"].stringValue
                    let url = json["results"][index]["url"].stringValue
                    self.pokeArray.append(PokeData(name: name, url: url))
                }
            case .failure(let error):
                print("😡😡 ERROR: \(error) failed to get data from url \(pokemonURL)")
            }
            completed()
        }
    }
}
