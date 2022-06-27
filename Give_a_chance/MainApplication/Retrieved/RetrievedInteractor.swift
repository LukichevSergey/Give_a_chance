//
//  RetrievedInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - RetrievedPresenterToInteractorProtocol (Presenter -> Interactor)
protocol RetrievedPresenterToInteractorProtocol: AnyObject {
    var data: [ReceiptModel] { get }
}

class RetrievedInteractor {

    // MARK: Properties
    weak var presenter: RetrievedInteractorToPresenterProtocol!
    
    var data: [ReceiptModel] = [
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 500, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 5, date: "19.08.2021"),
        ReceiptModel(status: .loading, name: "Алиматдинов Даутбек", card: "******62481", amount: 125, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 350, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 500, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 5, date: "19.08.2021"),
        ReceiptModel(status: .loading, name: "Алиматдинов Даутбек", card: "******62481", amount: 125, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 350, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 500, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 5, date: "19.08.2021"),
        ReceiptModel(status: .loading, name: "Алиматдинов Даутбек", card: "******62481", amount: 125, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 350, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 500, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 5, date: "19.08.2021"),
        ReceiptModel(status: .loading, name: "Алиматдинов Даутбек", card: "******62481", amount: 125, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 350, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 500, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 5, date: "19.08.2021"),
        ReceiptModel(status: .loading, name: "Алиматдинов Даутбек", card: "******62481", amount: 125, date: "19.08.2021"),
        ReceiptModel(status: .ok, name: "Алиматдинов Даутбек", card: "******62481", amount: 350, date: "19.08.2021"),
    ]

}

// MARK: Extension - RetrievedPresenterToInteractorProtocol
extension RetrievedInteractor: RetrievedPresenterToInteractorProtocol {
    
}
