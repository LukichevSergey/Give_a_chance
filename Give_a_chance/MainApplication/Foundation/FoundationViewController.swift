//
//  FoundationViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

// MARK: Protocol - FoundationPresenterToViewProtocol (Presenter -> View)
protocol FoundationPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - FoundationRouterToViewProtocol (Router -> View)
protocol FoundationRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class FoundationViewController: UIViewController {
    
    // MARK: - Property
    var presenter: FoundationViewToPresenterProtocol!

    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - private func
    private func commonInit() {

    }

    private func configureUI() {
        view.backgroundColor = .yellow
    }
}

// MARK: Extension - FoundationPresenterToViewProtocol 
extension FoundationViewController: FoundationPresenterToViewProtocol{
    
}

// MARK: Extension - FoundationRouterToViewProtocol
extension FoundationViewController: FoundationRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
