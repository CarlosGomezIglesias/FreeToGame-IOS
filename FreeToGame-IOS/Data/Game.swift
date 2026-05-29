//
//  Game.swift
//  FreeToGame-IOS
//
//  Created by Tardes on 28/5/26.
//

import Foundation
//codable es una interfaz que le dice a swift que esto se puede convertir de Json a esto y viceversa
//decodable convierte objetos a Json
//encodable convierte de objeto a Json
struct Game : Codable{
    let id: Int
    let title: String
    let thumbnail: String
    let genre: String
    let shortDescription: String
    let platform: String
    let description: String?
    let developer: String
    let publisher: String
    let gameUrl: String
    let profileUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id,title, thumbnail, genre, platform,description,developer,publisher
        case shortDescription = "short_description"
        case gameUrl = "game_url"
        case profileUrl = "freetogame_profile_url"
    }
    
}
