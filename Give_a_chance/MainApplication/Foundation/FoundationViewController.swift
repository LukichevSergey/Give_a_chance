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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold16
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "O фонде"
        
        return label
    }()
    
    private lazy var firstParagraphLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular10
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Обществу становится все труднее справляться с растущими социальными проблемами. Сегодня миллионы людей нуждаются в поддержке. Поэтому как никогда стала актуальна благотворительность, помогающая справиться с жизненными трудностями.\n\nБлаготворительный фонд «Подари шанс» для нуждающихся людей оказывает помощь разного рода: материальную, психологическую, юридическую.\n\nВ основе его деятельности – социальная защита и поддержка тех, кто в этом остро нуждается. Фонд финансирует благотворительные программы, инвестируя в них средства благотворителей. Основные источники финансирования – средства от частных и общественных благотворителей.\n\nНаша цель – обеспечить взаимодействие между благотворителями и получателями помощи."
        
        return label
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
        view.addSubview(firstParagraphLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.equalToSuperview().inset(16)
        }
        
        firstParagraphLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.right.left.equalToSuperview().inset(16)
        }
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
