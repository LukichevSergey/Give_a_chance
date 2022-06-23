//
//  FoundationInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - FoundationPresenterToInteractorProtocol (Presenter -> Interactor)
protocol FoundationPresenterToInteractorProtocol: AnyObject {

}

class FoundationInteractor {

    // MARK: Properties
    weak var presenter: FoundationInteractorToPresenterProtocol!

}

// MARK: Extension - FoundationPresenterToInteractorProtocol
extension FoundationInteractor: FoundationPresenterToInteractorProtocol {
    
}