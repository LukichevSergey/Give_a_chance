//
//  PromotionViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

// MARK: Protocol - PromotionPresenterToViewProtocol (Presenter -> View)
protocol PromotionPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - PromotionRouterToViewProtocol (Router -> View)
protocol PromotionRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class PromotionViewController: UIViewController {
    
    // MARK: - Property
    var presenter: PromotionViewToPresenterProtocol!

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
        view.backgroundColor = .red
    }
}

// MARK: Extension - PromotionPresenterToViewProtocol 
extension PromotionViewController: PromotionPresenterToViewProtocol{
    
}

// MARK: Extension - PromotionRouterToViewProtocol
extension PromotionViewController: PromotionRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
