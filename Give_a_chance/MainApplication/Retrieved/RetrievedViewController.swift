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
    func updateTable(withItems items: [ReceiptModel])
}

// MARK: Protocol - RetrievedRouterToViewProtocol (Router -> View)
protocol RetrievedRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class RetrievedViewController: UIViewController {
    
    // MARK: - Enum for UITableViewDiffableDataSource
    enum Section: CaseIterable {
        case main
    }
    
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ReceiptTableCell.self, forCellReuseIdentifier:  ReceiptTableCell.reuseIdentifier)
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = PaletteApp.white
        tableView.delegate = self
        
        return tableView
    }()
    
    private lazy var dataSource = UITableViewDiffableDataSource<Section, ReceiptModel>(tableView: tableView) { tableView, indexPath, item in
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptTableCell.reuseIdentifier, for: indexPath) as? ReceiptTableCell
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
        view.backgroundColor = PaletteApp.white
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loopButton)
        view.addSubview(tableView)
        
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
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(9)
            make.right.left.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
    }
}

// MARK: Extension - RetrievedPresenterToViewProtocol 
extension RetrievedViewController: RetrievedPresenterToViewProtocol{
    func updateTable(withItems items: [ReceiptModel]) {

        var snapshot = NSDiffableDataSourceSnapshot<Section, ReceiptModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(items, toSection: Section.main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
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

// MARK: Extension - UITableViewDelegate
extension RetrievedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}





