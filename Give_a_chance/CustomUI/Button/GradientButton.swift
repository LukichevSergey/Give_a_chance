//
//  GradientButton.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit
import SnapKit

class GradientButton: UIButton {
    
    private let gradientLayer = PaletteApp.standartGradient()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.tintColor = PaletteApp.white
        self.titleLabel?.font = OurFonts.fontPTSansBold20

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func configure() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
