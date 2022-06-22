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

}

class RetrievedInteractor {

    // MARK: Properties
    weak var presenter: RetrievedInteractorToPresenterProtocol!

}

// MARK: Extension - RetrievedPresenterToInteractorProtocol
extension RetrievedInteractor: RetrievedPresenterToInteractorProtocol {
    
}