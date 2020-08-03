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
    @IBOutlet weak var sortByLable: UILabel!
    @IBOutlet weak var searchTable: UITableView!
    var sortCategory = ["Name (A-Z)", "Name (Z-A)", "Rank ↑", "Rank ↓"]
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var searchList = [Item]()
    var filterList = [Item]()
    var searchActive: Bool = false
    private var searchResultService: SearchResultService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseSearchResultService()
        let searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(self.onClickOfSearchButton))
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        createPickerWithToolBar()
        getAllGitRepoList()
    }
    
    // MARK: Custom Methods
    
    private func getAllGitRepoList() {
        searchResultService?.getRepoListWithSerchString(searchText: "Va", handler: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let searchData):
                self.searchList = searchData.items ?? []
                self.resultLable.text = "Showing \(self.searchList.count) results"
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
    
    func sortRepoDataByCategory(category: String) {
        
        switch category {
        case SortType.ascending.rawValue:
            if searchActive {
              searchList = searchList.sorted(by: { ($0.login ?? "") < ($1.login ?? "") })
            } else {
              filterList = filterList.sorted(by: { ($0.login ?? "") < ($1.login ?? "") })
            }
            
        case SortType.descending.rawValue:
            if searchActive {
              searchList = searchList.sorted(by: { ($0.login ?? "") > ($1.login ?? "") })
            } else {
              filterList = filterList.sorted(by: { ($0.login ?? "") > ($1.login ?? "") })
            }
            
        case SortType.ascendingRank.rawValue:
            if searchActive {
              searchList = searchList.sorted(by: { ($0.score ?? 0) < ($1.score ?? 0) })
            } else {
              filterList = filterList.sorted(by: { ($0.score ?? 0) < ($1.score ?? 0) })
            }
            
        case SortType.descendingRank.rawValue:
            if searchActive {
              searchList = searchList.sorted(by: { ($0.score ?? 0) > ($1.score ?? 0) })
            } else {
              filterList = filterList.sorted(by: { ($0.score ?? 0) > ($1.score ?? 0) })
            }
            
        default:
            break
        }
        searchTable.reloadData()
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
   
    @objc func onClickOfSearchButton(sender: UIBarButtonItem) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.keyboardType = UIKeyboardType.default
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        present(searchController, animated: true, completion: nil)
    }
}

extension RepoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchActive ? filterList.count : searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self)) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let searchObject = searchActive ? filterList[indexPath.row] : searchList[indexPath.row]
        cell.configureData(repoData: searchObject)
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
        sortRepoDataByCategory(category: sortCategory[row])
        sortByLable.text = "Sort by \(sortCategory[row])"
    }
}

extension RepoListViewController: UISearchBarDelegate {
   func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.resultLable.text = "Showing \(self.searchList.count) results"
        searchTable.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchActive = true
        filterList = searchList.filter({ (repo) -> Bool in
            let value = repo.login ?? ""
            let searchString: NSString = value as NSString
            let range = searchString.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        self.resultLable.text = "Showing \(self.filterList.count) results"
        if searchText == "" {
           self.resultLable.text = "Showing \(self.searchList.count) results"
           searchActive = false
        }
        self.searchTable.reloadData()
    }
}
