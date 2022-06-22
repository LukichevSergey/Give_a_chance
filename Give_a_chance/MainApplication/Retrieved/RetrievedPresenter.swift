//
//  RetrievedPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - RetrievedViewToPresenterProtocol (View -> Presenter)
protocol RetrievedViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - RetrievedInteractorToPresenterProtocol (Interactor -> Presenter)
protocol RetrievedInteractorToPresenterProtocol: AnyObject {

}

class RetrievedPresenter {

    // MARK: Properties
    var router: RetrievedPresenterToRouterProtocol!
    var interactor: RetrievedPresenterToInteractorProtocol!
    weak var view: RetrievedPresenterToViewProtocol!
}

// MARK: Extension - RetrievedViewToPresenterProtocol
extension RetrievedPresenter: RetrievedViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - RetrievedInteractorToPresenterProtocol
extension RetrievedPresenter: RetrievedInteractorToPresenterProtocol {
    
}