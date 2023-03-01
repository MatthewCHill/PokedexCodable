//
//  PokemonDetailViewController.swift
//  PokedexCodable
//
//  Created by Matthew Hill on 2/28/23.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonSpriteImageView: UIImageView!
    @IBOutlet weak var pokemonMovesTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonMovesTableView.dataSource = self
        pokemonMovesTableView.delegate = self
      
    }
    
    // MARK: - Properties
    var pokemon: Pokemon?
    
    // MARK: - Functions
    
//    func updateViews(pokemon: Pokemon) {
//        PokemonController.fetchImage(forPokemon: pokemon) { image in
//            guard let image = image else {return}
//            DispatchQueue.main.async {
//                self.pokemon = pokemon
//                self.pokemonSpriteImageView.image = image
//                self.pokemonNameLabel.text = pokemon.name
//                self.pokemonIDLabel.text = String(pokemon.id)
//                self.pokemonMovesTableView.reloadData()
//            }
//        }
//    }
    
} // End of class

// MARK: - extension

extension PokemonDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemon = pokemon else {return 0}
        return pokemon.moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath)
        
        
        return cell
    }
    
}

