//
//  PokemonManager.swift
//  PokeApp
//
//  Created by Alex Okhtov on 14.05.2023.
//

import Foundation


class PokemonManager {
    func getPokemon() -> [Pokemon]{
        let data: PokemonPage = Bundle.main.decode(file: "pokedata.json")
        let pokemon: [Pokemon] = data.result
         
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping(DetailPokemon) -> ()){
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/1/", model: DetailPokemon.self){ data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
