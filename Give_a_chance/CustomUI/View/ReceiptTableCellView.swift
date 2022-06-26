//
//  ReceiptTableCellView.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 23.06.2022.
//

import UIKit

class ReceiptTableCellView: UIView {
    
    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = ListImages.Retrieved.checkGreen
        iconImage.contentMode = .scaleAspectFit
        
        return iconImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, cardNumberLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold12
        label.textAlignment = .right
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .right
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var amountStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel, dateLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
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
        backgroundColor = PaletteApp.white
        
        nameLabel.text = "Алиматдинов Даутбек"
        cardNumberLabel.text = "******62481"
        
        amountLabel.text = "500 ₽"
        dateLabel.text = "19.08.2021"
        
        addSubview(iconImage)
        addSubview(nameStack)
        addSubview(amountStack)
        
        iconImage.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(9)
        }
        
        nameStack.snp.makeConstraints { make in
            make.left.equalTo(iconImage.snp.right).offset(18)
            make.top.bottom.equalToSuperview().inset(9)
        }
        
        amountStack.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview().inset(9)
        }
    }
    
    func configure() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.45
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 10.0
    }
}
