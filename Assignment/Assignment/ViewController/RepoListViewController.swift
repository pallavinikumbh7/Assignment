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
    private var searchResultService: SearchResultService?
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    // MARK: Custom Methods
    
    private func initializeView() {
        initialiseSearchResultService()
        let searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(self.onClickOfSearchButton))
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        createPickerWithToolBar()
        getAllGitRepoList(searchText: "Varun", isFromSearch: false)
    }
    
    private func getAllGitRepoList(searchText: String, isFromSearch: Bool) {
        Utility.sharedInstance().showActivityIndicator(view: self.view)
        searchResultService?.getRepoListWithSerchString(searchText: searchText, handler: {[weak self] result in
            Utility.sharedInstance().hideActivityIndicator()
            guard let self = self else {return}
            switch result {
            case .success(let searchData):
                self.searchList = searchData.items ?? []
                self.resultLable.attributedText =  isFromSearch ? self.setAttributedText(completeText: "Search results for '\(searchText)'", boldText: "\(searchText)") : self.setAttributedText(completeText: "Showing \(self.searchList.count) results", boldText: "\(self.searchList.count)")
                self.title = isFromSearch ? searchText : "Home"
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
    
    private func sortRepoDataByCategory(category: String) {
        switch category {
        case SortType.ascending.rawValue:
              searchList = searchList.sorted(by: { ($0.login ?? "") < ($1.login ?? "") })
            
        case SortType.descending.rawValue:
              searchList = searchList.sorted(by: { ($0.login ?? "") > ($1.login ?? "") })
            
        case SortType.ascendingRank.rawValue:
              searchList = searchList.sorted(by: { ($0.score ?? 0) < ($1.score ?? 0) })
            
        case SortType.descendingRank.rawValue:
              searchList = searchList.sorted(by: { ($0.score ?? 0) > ($1.score ?? 0) })
            
        default:
            break
        }
        searchTable.reloadData()
    }
    
    private func createPickerWithToolBar() {
     picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 200)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
    }
    
    private func setAttributedText(completeText: String, boldText: String) -> NSAttributedString {
        return Utility.sharedInstance().addBoldText(fullString: completeText, boldString: boldText, font: regularFont ?? UIFont(), boldFont: boldFont ?? UIFont())
    }
    
    // MARK: Button Action Methods
    
    @IBAction func onClickOfSortButton(_ sender: UIButton) {
        self.view.addSubview(picker)
        self.view.addSubview(toolBar)
    }
    
    @IBAction func OnClickOfViewDetailsButton(_ sender: UIButton) {
        let userDetailViewController = Storyboards.main.instance.instantiateViewController(withIdentifier: Constants.StoryboardIDs.userDetailViewController) as! UserDetailViewController
        let searchObject = searchList[sender.tag]
        userDetailViewController.selectedUser = searchObject.login ?? ""
        self.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
   
    @objc func onClickOfSearchButton(sender: UIBarButtonItem) {
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.keyboardType = UIKeyboardType.default
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        present(searchController, animated: true, completion: nil)
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
        cell.viewDetailButton.tag = indexPath.row
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
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resultLable.attributedText = setAttributedText(completeText: "Showing \(self.searchList.count) results", boldText: "\(self.searchList.count)")
        searchTable.reloadData()
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar) {
        searchController.dismiss(animated: true, completion: nil)
        self.getAllGitRepoList(searchText: searchBar.text ?? "", isFromSearch: true)
    }
}
