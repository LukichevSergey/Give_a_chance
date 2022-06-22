//
//  UITabBar.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

enum TypeElementTabBar {
    case image(object: UIImage)
}

extension UITabBar {
    func addIconInTabBar(index: Int, typeAvatar: TypeElementTabBar) {
        switch typeAvatar {
        case .image(let image): addImageView(index: index, image: image)
        }
    }
    
    func actionForItemView(index: Int) {
        stopAnimationAllLottieView()

        if let view = viewWithTag(2000 + index), let imageView = view.viewWithTag(1000 + index) as? UIImageView {
            view.layer.borderWidth = 2
            imageView.layer.borderWidth = 0
        }
    }
    
    func setImageWithOutAnimation(index: Int) {
        guard let items = items, index < items.count else { return }
    }
    
    func removeTabBarItem(index: Int) {
        if let view = viewWithTag(2000 + index) {
            view.removeFromSuperview()
            return
        }
    }
    
    func checkTabBarItem(index: Int) -> Bool {
        if let _ = viewWithTag(2000 + index) { return true }
        return false
    }
    
    fileprivate func addImageView(index: Int, image: UIImage) {
        let widthAndHeightForImage: CGFloat = 28
        let widthAndHeightForView: CGFloat = 36
        
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .clear
        view.frame = getFrameIcon(index: index, widthAndHeight: widthAndHeightForView, y: 9)
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = widthAndHeightForView / 2
        view.layer.masksToBounds = true
        view.tag = 2000 + index
        addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = widthAndHeightForImage / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.tag = 1000 + index
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(widthAndHeightForImage)
        }
    }

    fileprivate func getFrameIcon(index: Int, widthAndHeight: CGFloat, y: CGFloat = 12.0) -> CGRect {
        let totalW = UIScreen.main.bounds.size.width
        let singleW = totalW / CGFloat(self.items?.count ?? 1)
        let x = ceil(CGFloat(index) * singleW + (singleW - widthAndHeight) / 2.0)
        return CGRect(x: x, y: y, width: widthAndHeight, height: widthAndHeight)
    }

    fileprivate func stopAnimationAllLottieView() {
        guard let items = self.items else { return }
        
        for index in 0 ..< items.count {
            if let view = viewWithTag(2000 + index), let imageView = view.viewWithTag(1000 + index) as? UIImageView {
                view.layer.borderWidth = 0
                imageView.layer.borderWidth = 1
            }
        }
    }
}
