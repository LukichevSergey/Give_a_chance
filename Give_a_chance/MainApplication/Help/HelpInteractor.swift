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

}

class HelpInteractor {

    // MARK: Properties
    weak var presenter: HelpInteractorToPresenterProtocol!

}

// MARK: Extension - HelpPresenterToInteractorProtocol
extension HelpInteractor: HelpPresenterToInteractorProtocol {
    
}