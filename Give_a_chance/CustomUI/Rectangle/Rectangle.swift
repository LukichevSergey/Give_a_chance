//
//  Rectangle.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

class Rectangle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configure(width: CGFloat, height: CGFloat) {

        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createBezierPath(width: width, height: height).cgPath

        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.position = CGPoint(x: 0, y: 0)

        self.layer.addSublayer(shapeLayer)
        
        let shapeLayer2 = CAShapeLayer()

        shapeLayer2.path = createBezierPath2(width: width - 20, height: height - 20).cgPath

        shapeLayer2.strokeColor = UIColor(hex: "F9BECB").cgColor
        shapeLayer2.fillColor = UIColor.white.cgColor
        shapeLayer2.lineWidth = 2.0
        shapeLayer2.position = CGPoint(x: 10, y: 10)

        self.layer.addSublayer(shapeLayer2)
    }

    func createBezierPath(width: CGFloat, height: CGFloat) -> UIBezierPath {

        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))

        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * 0.35))
        path.addLine(to: CGPoint(x: 10, y: height * 0.25))
        path.addLine(to: CGPoint(x: 0, y: height * 0.15))

        path.close()

        return path
    }
    
    func createBezierPath2(width: CGFloat, height: CGFloat) -> UIBezierPath {

        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))

        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * 0.34))
        path.addLine(to: CGPoint(x: 10, y: height * 0.20))
        path.addLine(to: CGPoint(x: 0, y: height * 0.10))

        path.close()

        return path
    }
    
}
