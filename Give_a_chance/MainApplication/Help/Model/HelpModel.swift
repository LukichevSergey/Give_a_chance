//
//  HelpModel.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 26.06.2022.
//

import Foundation

class HelpModel: Hashable {
    
    static func == (lhs: HelpModel, rhs: HelpModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(name)
    }
    
    let uuid = UUID()
    let image: String
    let name: String
    let status: String
    let diagnosis: String
    
    init(image: String, name: String, status: String, diagnosis: String) {
        self.image = image
        self.name = name
        self.status = status
        self.diagnosis = diagnosis
    }
}
