//
//  Pokemon.swift
//  PokedexCodable
//
//  Created by Matthew Hill on 2/28/23.
//

import Foundation

struct TopLevel: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonResults]
}

struct PokemonResults: Decodable {
    let name: String
    let url: String
}
