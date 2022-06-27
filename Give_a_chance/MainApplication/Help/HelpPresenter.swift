//
//  HelpPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - HelpViewToPresenterProtocol (View -> Presenter)
protocol HelpViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - HelpInteractorToPresenterProtocol (Interactor -> Presenter)
protocol HelpInteractorToPresenterProtocol: AnyObject {

}

class HelpPresenter {

    // MARK: Properties
    var router: HelpPresenterToRouterProtocol!
    var interactor: HelpPresenterToInteractorProtocol!
    weak var view: HelpPresenterToViewProtocol!
}

// MARK: Extension - HelpViewToPresenterProtocol
extension HelpPresenter: HelpViewToPresenterProtocol {
    func viewDidLoad() {
        view.updateCollection(with: interactor.data)
    }
}

// MARK: Extension - HelpInteractorToPresenterProtocol
extension HelpPresenter: HelpInteractorToPresenterProtocol {
    
}
