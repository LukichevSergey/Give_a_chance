//
//  ThirdOnbordingViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit
import SnapKit

// MARK: Protocol - ThirdOnbordingPresenterToViewProtocol (Presenter -> View)
protocol ThirdOnbordingPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - ThirdOnbordingRouterToViewProtocol (Router -> View)
protocol ThirdOnbordingRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class ThirdOnbordingViewController: UIViewController {
    
    // MARK: - Property
    var presenter: ThirdOnbordingViewToPresenterProtocol!
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.titleLabel?.font = OurFonts.fontPTSansBold10
        button.setTitleColor(PaletteApp.black, for: .normal)
        button.setTitle("Пропустить".uppercased(), for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mainImage: UIImageView = {
        let descriptionImage = UIImageView()
        descriptionImage.image = ListImages.Onbording.thirdOnbording
        descriptionImage.contentMode = .scaleAspectFit
        
        return descriptionImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansBold20
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Помогать легко".uppercased()
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = PaletteApp.black
        label.font = OurFonts.fontPTSansRegular14
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста"
        
        return label
    }()
    
    private lazy var nextButton: GradientButton = {
        let button = GradientButton(frame: .zero)
        button.setTitle("Далее".uppercased(), for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        return button
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = nextButton.frame.size.height / 2
    }
    
    // MARK: - private func
    private func commonInit() {

    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(skipButton)
        view.addSubview(mainImage)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(nextButton)
        
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().inset(19)
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(skipButton.snp.bottom).offset(68)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(74)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(34)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(73)
            make.centerX.equalToSuperview()
            make.width.equalTo(254)
            make.height.equalTo(53)
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    @objc private func nextButtonTapped() {
        presenter.nextButtonTapped()
    }
    
    @objc private func skipButtonTapped() {
        presenter.skipButtonTapped()
    }
}

// MARK: Extension - ThirdOnbordingPresenterToViewProtocol
extension ThirdOnbordingViewController: ThirdOnbordingPresenterToViewProtocol{
    
}

// MARK: Extension - ThirdOnbordingRouterToViewProtocol
extension ThirdOnbordingViewController: ThirdOnbordingRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
