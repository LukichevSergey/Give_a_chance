//
//  RetrievedViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit
import SnapKit

// MARK: Protocol - RetrievedPresenterToViewProtocol (Presenter -> View)
protocol RetrievedPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - RetrievedRouterToViewProtocol (Router -> View)
protocol RetrievedRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class RetrievedViewController: UIViewController {
    
    // MARK: - Property
    var presenter: RetrievedViewToPresenterProtocol!
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold16
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Пожертвования"
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.darkGray
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "*Суммы пожертвования в данном разделе обновляются \"Онлайн\" (Онлайн переводы: Банковские карты, G-Pay, Apple Pay, Яндекс.Деньги, SMS)"
        
        return label
    }()
    
    private lazy var loopButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "loop"), for: .normal)

        return button
    }()
    
    private lazy var test: ReceiptTableCellView = {
        let view = ReceiptTableCellView()
        
        return view
    }()

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
        view.backgroundColor = PaletteApp.white
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loopButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.right.left.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.right.left.equalToSuperview().inset(16)
        }
        
        loopButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().inset(22)
        }
        
        
        view.addSubview(test)
        test.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().inset(22)
            make.left.equalToSuperview().inset(16)
        }
    }
}

// MARK: Extension - RetrievedPresenterToViewProtocol 
extension RetrievedViewController: RetrievedPresenterToViewProtocol{
    
}

// MARK: Extension - RetrievedRouterToViewProtocol
extension RetrievedViewController: RetrievedRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}





