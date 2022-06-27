//
//  HelpViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

// MARK: Protocol - HelpPresenterToViewProtocol (Presenter -> View)
protocol HelpPresenterToViewProtocol: AnyObject {
    func updateCollection(with data: [HelpModel])
}

// MARK: Protocol - HelpRouterToViewProtocol (Router -> View)
protocol HelpRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class HelpViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Property
    var presenter: HelpViewToPresenterProtocol!
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 22, left: 22, bottom: 22, right: 22)
        layout.minimumLineSpacing = 22
        layout.minimumInteritemSpacing = 22
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 500)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(HelpCollectionCell.self, forCellWithReuseIdentifier: HelpCollectionCell.reuseIdentifier)
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, HelpModel>(collectionView: collectionView) { collectionView, indexPath, item in
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HelpCollectionCell.reuseIdentifier, for: indexPath) as? HelpCollectionCell else {
            return UICollectionViewCell(frame: .zero)
        }
        
        cell.configuration(withItemModel: item)

        return cell
    }

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
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: Extension - HelpPresenterToViewProtocol 
extension HelpViewController: HelpPresenterToViewProtocol{
    func updateCollection(with data: [HelpModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, HelpModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: Extension - HelpRouterToViewProtocol
extension HelpViewController: HelpRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}

extension HelpViewController: UICollectionViewDelegate {
    
}
