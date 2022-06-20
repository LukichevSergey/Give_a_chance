//
//  PaletteApp.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

struct PaletteApp {
    
    //MARK: - Colors
    
    static var white: UIColor { return UIColor(hex: "#FFFFFF") }  // белый
    static var black: UIColor { return UIColor(hex: "#000000") }  // черный

    //MARK: - Gradients
    
    static let standartGradient: () -> CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#F4647D").cgColor, UIColor(hex: "#C85DA6").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        return gradientLayer
    }
}
