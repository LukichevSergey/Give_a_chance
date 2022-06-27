//
//  HelpInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - HelpPresenterToInteractorProtocol (Presenter -> Interactor)
protocol HelpPresenterToInteractorProtocol: AnyObject {
    var data: [HelpModel] { get }
}

class HelpInteractor {

    // MARK: Properties
    weak var presenter: HelpInteractorToPresenterProtocol!
    
    let data: [HelpModel] = [
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.")
    ]

}

// MARK: Extension - HelpPresenterToInteractorProtocol
extension HelpInteractor: HelpPresenterToInteractorProtocol {
    
}
