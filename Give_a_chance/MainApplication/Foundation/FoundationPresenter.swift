//
//  FoundationPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - FoundationViewToPresenterProtocol (View -> Presenter)
protocol FoundationViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - FoundationInteractorToPresenterProtocol (Interactor -> Presenter)
protocol FoundationInteractorToPresenterProtocol: AnyObject {

}

class FoundationPresenter {

    // MARK: Properties
    var router: FoundationPresenterToRouterProtocol!
    var interactor: FoundationPresenterToInteractorProtocol!
    weak var view: FoundationPresenterToViewProtocol!
}

// MARK: Extension - FoundationViewToPresenterProtocol
extension FoundationPresenter: FoundationViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - FoundationInteractorToPresenterProtocol
extension FoundationPresenter: FoundationInteractorToPresenterProtocol {
    
}