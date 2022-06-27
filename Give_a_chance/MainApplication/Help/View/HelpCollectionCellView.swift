//
//  HelpCollectionCellView.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 26.06.2022.
//

import UIKit

class HelpCollectionCellView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.white
        
        return view
    }()
    
    private lazy var imageView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.gray
        
        return view
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.white
        
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
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold10
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var diagnosisLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold12
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
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
            make.edges.equalToSuperview()
        }
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.red.cgColor
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.green.cgColor
        
        descriptionView.snp.makeConstraints { make in
            make.width.equalTo(290)
            make.top.equalTo(imageView.snp.bottom).inset(50)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(142)
        }
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.borderColor = UIColor.blue.cgColor

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
        backgroundColor = PaletteApp.white
        
        nameLabel.text = item.name
        statusLabel.text = item.status
        diagnosisLabel.text = item.diagnosis
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
