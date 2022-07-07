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
    
    private lazy var segmentedControll: CustomSegmentedControl = {
        let segmentedControll = CustomSegmentedControl()
        segmentedControll.delegate = self
        
        return segmentedControll
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(HelpTableCell.self, forCellReuseIdentifier:  HelpTableCell.reuseIdentifier)
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.backgroundColor = PaletteApp.helpTableBackgroundGray
        
        return tableView
    }()
    
    private lazy var dataSource = UITableViewDiffableDataSource<Section, HelpModel>(tableView: tableView) { tableView, indexPath, item in
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableCell.reuseIdentifier, for: indexPath) as? HelpTableCell
        else {
            return UITableViewCell(style: .default, reuseIdentifier: nil)
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
        view.backgroundColor = PaletteApp.helpTableBackgroundGray
        
        view.addSubview(segmentedControll)
        segmentedControll.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(16)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControll.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
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

// MARK: Extension - CustomSegmentedControlDelegate
extension HelpViewController: CustomSegmentedControlDelegate {
    func segmentedControlTapped(withStatus status: CustomSegmentedControlElement.Status) {
        presenter.segmentedControlTapped(withStatus: status)
    }
}
