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
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    
    func updateViews() {
        guard let pokemon = pokemon else {return}
        NetworkingController.fetchSprite(for: pokemon.sprites.frontShiny) { result in
            switch result {
                
            case .success(let sprite):
                DispatchQueue.main.async {
                    self.pokemonSpriteImageView.image = sprite
                    self.pokemonNameLabel.text = pokemon.name
                    self.pokemonIDLabel.text = String(pokemon.id)
                    self.pokemonMovesTableView.reloadData()
                }
                
            case .failure(let error):
                print("There was an error! \(error.errorDescription)")
            }
        }
    }
    
} // End of class

// MARK: - extension

extension PokemonDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemon = pokemon else {return 0}
        return pokemon.moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath)
        
        let index = pokemon?.moves[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = index?.move.name
        cell.contentConfiguration = config
        
        return cell
    }
    
}

