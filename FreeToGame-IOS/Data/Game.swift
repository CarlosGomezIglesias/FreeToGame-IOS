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
    
}
