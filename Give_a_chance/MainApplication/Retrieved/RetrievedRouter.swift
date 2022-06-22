//
//  RetrievedRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - RetrievedPresenterToRouterProtocol (Presenter -> Router)
protocol RetrievedPresenterToRouterProtocol: AnyObject {

}

class RetrievedRouter {

    // MARK: Properties
    weak var view: RetrievedRouterToViewProtocol!
}

// MARK: Extension - RetrievedPresenterToRouterProtocol
extension RetrievedRouter: RetrievedPresenterToRouterProtocol {
    
}