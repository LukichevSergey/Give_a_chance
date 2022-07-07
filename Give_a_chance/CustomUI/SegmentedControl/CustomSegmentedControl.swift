//
//  CustomSegmentedControl.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 07.07.2022.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func segmentedControlTapped(withStatus status: CustomSegmentedControlElement.Status)
}

class CustomSegmentedControl: UIView {
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    private var activeStatus: CustomSegmentedControlElement.Status = .open {
        didSet {
            switch activeStatus {
            case .open:
                openSegment.isSelected = true
                closedSegment.isSelected = false
            case .closed:
                openSegment.isSelected = false
                closedSegment.isSelected = true
            }
        }
    }
    
    private lazy var openSegment: CustomSegmentedControlElement = {
        let openSegment = CustomSegmentedControlElement(title: "Кому помочь", status: .open)
        openSegment.delegate = self
        openSegment.isSelected = true
        
        return openSegment
    }()
    
    private lazy var closedSegment: CustomSegmentedControlElement = {
        let closedSegment = CustomSegmentedControlElement(title: "Кому помогли", status: .closed)
        closedSegment.delegate = self
        
        return closedSegment
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [openSegment, closedSegment])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
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
        backgroundColor = PaletteApp.segmentBackgroundGray

        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
}

extension CustomSegmentedControl: CustomSegmentedControlElementDelegate {
    func segmentedElementTapped(withStatus status: CustomSegmentedControlElement.Status) {
        if activeStatus != status {
            activeStatus = status
            delegate?.segmentedControlTapped(withStatus: status)
        }
    }
}
