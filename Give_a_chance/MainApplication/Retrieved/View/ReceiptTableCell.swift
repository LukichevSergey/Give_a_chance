//
//  ReceiptTableCell.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 26.06.2022.
//

import UIKit

class ReceiptTableCell: UITableViewCell {
    
    // MARK: - Property
    static let reuseIdentifier = String(describing: ReceiptTableCell.self)
    
    override func prepareForReuse() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configuration(withItemModel item: ReceiptModel) {
        let view = ReceiptTableCellView()
        view.configure(withItemModel: item)
        
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
