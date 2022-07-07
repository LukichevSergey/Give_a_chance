//
//  HelpTableCell.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 07.07.2022.
//

import UIKit

class HelpTableCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: HelpTableCell.self)
    
    override func prepareForReuse() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configuration(withItemModel item: HelpModel) {
        let view = HelpTableCellView()
        view.configure(withItemModel: item)
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
