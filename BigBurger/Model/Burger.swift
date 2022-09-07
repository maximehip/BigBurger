//
//  Burger.swift
//  BigBurger
//
//  Created by Maxime on 07/09/2022.
//

import Foundation

struct Burger: Codable, Hashable {
    let ref: String
    let title: String
    let description: String
    let thumbnail: String
    let price: Int
}
