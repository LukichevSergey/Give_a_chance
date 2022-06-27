//
//  HelpCollectionCell.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 26.06.2022.
//

import UIKit

class HelpCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: HelpCollectionCell.self)
    
    override func prepareForReuse() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configuration(withItemModel item: HelpModel) {
        let view = HelpCollectionCellView()
        view.configure(withItemModel: item)
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
