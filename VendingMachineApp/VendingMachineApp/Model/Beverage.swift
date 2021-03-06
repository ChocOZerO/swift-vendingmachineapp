//
//  Beverage.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Codable {
    private let brand: String
    private let weight: Int
    let price: Int
    let name: String
    private let dateOfManufacture: Date
    let image: String

    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, image: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.image = image
    }

    var description: String {
        return "\(brand), \(weight)ml, \(price)원, \(name), \(dateOfManufacture.getStringFromDate())"
    }

    func isBuyable(with: Int) -> Bool {
        return with >= price
    }

}

extension Beverage: Hashable {

    var hashValue: Int {
        return self.weight * self.price * 16777619
    }

    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return (lhs.brand == rhs.brand)
            && (lhs.name == rhs.name)
            && (lhs.weight == rhs.weight)
            && (lhs.price == rhs.price)
    }

}
