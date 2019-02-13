//
//  Wage.swift
//  Window Shopper
//
//  Created by Madian on 2/13/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation


class Wage{
    static func getHours(forWage wage: Double, andPrice price: Double) -> Int{
        let res = Int(ceil(price / wage))
        return res
    }
}
