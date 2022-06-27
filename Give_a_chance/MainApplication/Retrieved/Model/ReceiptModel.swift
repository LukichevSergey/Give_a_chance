//
//  ReceiptModel.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 26.06.2022.
//

import UIKit

class ReceiptModel: Hashable {
    
    static func == (lhs: ReceiptModel, rhs: ReceiptModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(date)
    }
    
    let uuid = UUID()
    var status: Status
    let name: String
    let card: String
    let amount: Double
    let date: String
    
    init(status: Status, name: String, card: String, amount: Double, date: String) {
        self.status = status
        self.name = name
        self.card = card
        self.amount = amount
        self.date = date
    }
}

extension ReceiptModel {
    enum Status {
        case ok, loading
        
        var getIcon: UIImage {
            switch self {
            case .ok: return ListImages.Retrieved.checkGreen
            case .loading: return ListImages.Retrieved.loadingOrange
            }
        }
    }
}
