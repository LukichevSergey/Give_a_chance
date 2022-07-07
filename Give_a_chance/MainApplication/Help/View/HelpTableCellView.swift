//
//  HelpTableCellView.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 07.07.2022.
//

import UIKit

class HelpTableCellView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.helpTableBackgroundGray
        
        return view
    }()
    
    private lazy var imageView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.white
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold18
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.darkGray
        label.font = OurFonts.fontPTSansBold10
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var diagnosisLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.darkGray
        label.font = OurFonts.fontPTSansBold12
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var slider: CustomSlider = {
        let slider = CustomSlider()
        
        return slider
    }()
    
    private lazy var dataView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.white
        
        return view
    }()
    
    private lazy var neededAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var neededTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Cобрано".uppercased()
        
        return label
    }()
    
    private lazy var neededStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [neededAmountLabel, neededTitleLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 7
        
        return stack
    }()
    
    private lazy var collectedAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold16
        label.textAlignment = .right
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var collectedTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold10
        label.textAlignment = .right
        label.numberOfLines = 1
        label.text = "Нужно".uppercased()
        
        return label
    }()
    
    private lazy var collectedStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [collectedAmountLabel, collectedTitleLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 7
        
        return stack
    }()
    
    private lazy var collectedView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hex: "#F9BECB", alpha: 0.15)
        
        return view
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
        
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionView)
        
        descriptionView.addSubview(nameLabel)
        descriptionView.addSubview(statusLabel)
        descriptionView.addSubview(diagnosisLabel)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(50)
            make.bottom.equalToSuperview()
            make.width.equalTo(imageView).multipliedBy(0.9)
            make.centerX.equalTo(imageView)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(9)
            make.right.left.equalToSuperview().inset(16)
        }

        diagnosisLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(9)
            make.right.left.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(withItemModel item: HelpModel) {
        backgroundColor = PaletteApp.helpTableBackgroundGray
        
        nameLabel.text = item.name
        statusLabel.text = item.status.uppercased()
        diagnosisLabel.text = item.diagnosis
        
        if let neededAmount = item.neededAmount, let collectedAmount = item.collectedAmount {
            statusLabel.isHidden = true
            neededAmountLabel.text = "\(neededAmount) ₽"
            collectedAmountLabel.text = "\(collectedAmount) ₽"
            
            descriptionView.addSubview(slider)
            slider.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(9)
                make.right.left.equalToSuperview().inset(16)
            }
            
            slider.minimumValue = 5
            slider.maximumValue = 50
            slider.value = 25
            slider.isContinuous = true
            slider.tintColor = UIColor(hex: "#F9BECB")
            slider.setThumbImage(UIImage(named: "slider"), for: .normal)
            slider.setSlider(slider: slider)
            
            descriptionView.addSubview(dataView)
            dataView.snp.makeConstraints { make in
                make.top.equalTo(slider.snp.bottom).offset(16)
                make.right.left.equalToSuperview()
                make.height.equalTo(58)
            }
            
            dataView.addSubview(neededStack)
            neededStack.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
            }
            
            collectedView.addSubview(collectedStack)
            collectedStack.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(25)
                make.centerY.equalToSuperview()
            }
            
            dataView.addSubview(collectedView)
            collectedView.snp.makeConstraints { make in
                make.right.equalToSuperview()
                make.height.equalTo(58)
                make.width.equalToSuperview().multipliedBy(0.5)
            }
            
            diagnosisLabel.snp.remakeConstraints { make in
                make.top.equalTo(dataView.snp.bottom).offset(16)
                make.right.left.bottom.equalToSuperview().inset(16)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectedView.clipsToBounds = true
        collectedView.roundCorners(corners: [.topLeft, .bottomLeft], radius: collectedView.frame.size.height / 2)
    }
}
