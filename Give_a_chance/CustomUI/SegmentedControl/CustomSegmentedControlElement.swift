//
//  CustomSegmentedControlElement.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 07.07.2022.
//

import UIKit

protocol CustomSegmentedControlElementDelegate: AnyObject {
    func segmentedElementTapped(withStatus status: CustomSegmentedControlElement.Status)
}

class CustomSegmentedControlElement: UIView {
    
    weak var delegate: CustomSegmentedControlElementDelegate?
    
    enum Status {
        case open, closed
    }
    
    private var status: Status = .open
    private let gradientLayer = PaletteApp.standartGradient()
    
    var isSelected: Bool = false {
        didSet {
            if isSelected {
                layer.insertSublayer(gradientLayer, at: 0)
                label.textColor = PaletteApp.white
            } else {
                layer.sublayers?.first?.removeFromSuperlayer()
                backgroundColor = PaletteApp.segmentBackgroundGray
                label.textColor = PaletteApp.black
            }
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold10
        label.textAlignment = .center
        label.numberOfLines = 1
        
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
    
    init(title: String, status: Status) {
        super.init(frame: .zero)
        self.label.text = title
        self.status = status
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = PaletteApp.segmentBackgroundGray
        addSubview(label)
        label.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.edges.equalToSuperview()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        addGestureRecognizer(tap)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 15
        layer.masksToBounds = true
        gradientLayer.frame = bounds
    }
    
    @objc private func tapOnView() {
        delegate?.segmentedElementTapped(withStatus: status)
    }
}
