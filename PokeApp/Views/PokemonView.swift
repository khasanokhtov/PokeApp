//
//   PokemonView.swift
//  PokeApp
//
//  Created by Alex Okhtov on 17.05.2023.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")){ image in
                if let image = image {
                    image
                        .resizable ()
                        .scaledToFit ()
                        .frame (width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame (width: dimensions, height: dimensions)
            }
            .background(Color(.gray))
            .backgroundStyle(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

struct _PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
