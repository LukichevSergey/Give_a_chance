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
    
    private lazy var topGrayView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = PaletteApp.gray
        
        return view
    }()
    
    private lazy var girlImage: UIImageView = {
        let girlImage = UIImageView()
        girlImage.image = UIImage(named: "girl")
        girlImage.contentMode = .scaleAspectFit
        
        return girlImage
    }()
    
    private lazy var slider: CustomSlider = {
        let slider = CustomSlider()
        return slider
    }()
    
    private lazy var rectangle: Rectangle = {
        let rectangle = Rectangle()

        return rectangle
    }()
    
    private lazy var sticker: Sticker = {
        let view = Sticker()
        
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
        slider.minimumValue = 5
        slider.maximumValue = 50
        slider.value = 25
        slider.isContinuous = true
        slider.tintColor = UIColor(hex: "#F9BECB")
        slider.setThumbImage(UIImage(named: "slider"), for: .normal)
        
        slider.setSlider(slider: slider)
    }

    private func configureUI() {
        
        view.backgroundColor = PaletteApp.white
        
        view.addSubview(slider)
        view.addSubview(topGrayView)
        topGrayView.addSubview(girlImage)
        view.addSubview(rectangle)
        view.addSubview(sticker)
        
        slider.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
        
        topGrayView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(375)
        }
        
        girlImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(12)
        }
        
        rectangle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(150)
            make.width.equalTo(327)
            make.height.equalTo(148)
        }
        rectangle.configure(width: 327, height: 148)
        
        sticker.snp.makeConstraints { make in
            make.bottom.equalTo(rectangle.snp.top).inset(-12)
            make.left.equalToSuperview()
        }
        
        sticker.configure(image: UIImage(named: "slider")!, title: "Подарить шанс на здоровье", subtitle: "Помогите прямо сейчас")
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
