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
    var openDataSource: [HelpModel] { get }
    var closedDataSource: [HelpModel] { get }
}

class HelpInteractor {

    // MARK: Properties
    weak var presenter: HelpInteractorToPresenterProtocol!
    
    let openDataSource: [HelpModel] = [
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.", neededAmount: 5000000, collectedAmount: 123456),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.", neededAmount: 8000000, collectedAmount: 2345356),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.", neededAmount: 3000000, collectedAmount: 500500),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.", neededAmount: 1000000, collectedAmount: 950000)
    ]
    
    let closedDataSource: [HelpModel] = [
        HelpModel(image: "", name: "Милованова Светлана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска."),
        HelpModel(image: "", name: "Милованова Милана", status: "Сбор закрыт", diagnosis: "Диагноз: 4 года, Нейробластома малого таза, стадия по INSS IV. Группа высокого риска.")
    ]

}

// MARK: Extension - HelpPresenterToInteractorProtocol
extension HelpInteractor: HelpPresenterToInteractorProtocol {
    
}
