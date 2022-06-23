//
//  CGFloat+Converter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 23.06.2022.
//

import UIKit

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
