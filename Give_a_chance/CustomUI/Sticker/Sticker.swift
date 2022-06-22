//
//  Sticker.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//

import Foundation
import UIKit

class Sticker: UIView {
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hex: "#f9becb", alpha: 0.25)
        
        return view
    }()
    
    private lazy var viewForImage: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.white
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hex: "#F4647D")
        label.font = OurFonts.fontPTSansBold12
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 2
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(viewForImage)
        viewForImage.snp.makeConstraints { make in
            make.width.height.equalTo(36)
            make.left.equalToSuperview().inset(29)
            make.top.equalToSuperview().inset(13)
            make.bottom.equalToSuperview().inset(9)
        }
        
        viewForImage.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(18)
        }
        
        contentView.addSubview(labelsStack)
        labelsStack.snp.makeConstraints { make in
            make.left.equalTo(viewForImage.snp.right).offset(13)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(viewForImage)
        }
    }
    
    func configure(image: UIImage, title: String, subtitle: String?) {
        imageView.image = image
        titleLabel.text = title
        labelsStack.addArrangedSubview(titleLabel)
        
        if let subtitle = subtitle {
            subtitleLabel.text = subtitle
            labelsStack.addArrangedSubview(subtitleLabel)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewForImage.clipsToBounds = true
        viewForImage.layer.cornerRadius = 18
        
        viewForImage.layer.shadowColor = UIColor.black.cgColor
        viewForImage.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        viewForImage.layer.shadowRadius = 5.0
        viewForImage.layer.shadowOpacity = 0.15
        viewForImage.layer.masksToBounds = false
        
        contentView.clipsToBounds = true
        contentView.roundCorners(corners: [.topRight, .bottomRight], radius: contentView.frame.size.height / 2)
    }
}
