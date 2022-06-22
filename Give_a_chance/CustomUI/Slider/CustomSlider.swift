//
//  CustomSlider.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

class CustomSlider: UISlider {
   let trackHeight: CGFloat = 14
   override func trackRect(forBounds bounds: CGRect) -> CGRect {
      let track = super.trackRect(forBounds: bounds)
      return CGRect(x: track.origin.x, y: track.origin.y, width: track.width, height: trackHeight)
   }
    
    private let gradientLayer = PaletteApp.sliderGradient()
    
    func setSlider(slider:UISlider) {
        gradientLayer.cornerRadius = gradientLayer.bounds.height/2.0
        let frame = CGRect.init(x:0, y:0, width:slider.frame.size.width, height:5)
        gradientLayer.frame = frame
        
        UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.isOpaque, 0.0);
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()

            image.resizableImage(withCapInsets: UIEdgeInsets.zero)

            slider.setMinimumTrackImage(image, for: .normal)
        }
    }
}
