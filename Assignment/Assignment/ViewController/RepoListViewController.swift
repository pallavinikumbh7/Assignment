//
//  RepoListViewController.swift
//  Assignment
//
//  Created by Pallavi on 31/07/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var searchTable: UITableView!
    var selectedCountry: String?
    var sortCategory = ["Name (A-Z)", "Name (Z-A)", "Rank ↑", "Rank ↓"]
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var searchList = [Item]()
    private var searchResultService: SearchResultService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseSearchResultService()
        let searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(self.onClickOfSearchButton))
        self.navigationItem.rightBarButtonItem = searchButton
        createPickerWithToolBar()
        getAllGitRepoList()
    }
    
    // MARK: Custom Methods
    
    private func getAllGitRepoList() {
        searchResultService?.getRepoListWithSerchString(searchText: "a", handler: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let searchData):
                self.searchList = searchData.items ?? []
                self.searchTable.reloadData()
            case .failure(let error):
                self.searchList = []
                print(error)
            }
        })
    }
    
    private func initialiseSearchResultService() {
        if searchResultService == nil {
            searchResultService = SearchResultService()
        }
    }
    
    func createPickerWithToolBar() {
     picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 200)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
    }
    
    // MARK: Button Action Methods
    @IBAction func onClickOfSortButton(_ sender: UIButton) {
        self.view.addSubview(picker)
        self.view.addSubview(toolBar)
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    @objc func onClickOfSearchButton() {
        print("Search button click")
    }
}
extension RepoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self)) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let searchObject = searchList[indexPath.row]
        cell.nameLable.text = searchObject.login
        cell.scoreLabel.text = String(format: "Score: %@", searchObject.score ?? "")
        return cell
    }
    
}
extension RepoListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortCategory[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = sortCategory[row]
        print(selectedCountry ?? "")
    }
}
