//
//  ViewModel.swift
//  PokeApp
//
//  Created by Alex Okhtov on 14.05.2023.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject{
     private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        print(self.pokemonList)
    }
}
