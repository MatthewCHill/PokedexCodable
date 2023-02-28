//
//  PokemonTableViewCell.swift
//  PokedexCodable
//
//  Created by Matthew Hill on 2/28/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonSpriteImageView: UIImageView!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    
    // MARK: - Functions
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonSpriteImageView.image = nil
        pokemonNameLabel.text = nil
        pokemonIdLabel.text = nil
    }
    
    func updateUI(forPokemon pokemon: PokemonResults) {
        NetworkingController.fetchPokemon(with: pokemon.url) { result in
            switch result {
                
            case .success(let pokemon):
                self.fetchSprite(forPokemon: pokemon)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    func fetchSprite(forPokemon: Pokemon) {
        NetworkingController.fetchSprite(for: forPokemon.sprites.frontShiny) { result in
            switch result {
                
            case .success(let sprite):
                DispatchQueue.main.async {
                    self.pokemonSpriteImageView.image = sprite
                    self.pokemonNameLabel.text = forPokemon.name.capitalized
                    self.pokemonIdLabel.text = "No. \(forPokemon.id)"
                }
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
}
