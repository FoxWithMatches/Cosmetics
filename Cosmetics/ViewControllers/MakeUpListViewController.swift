//
//  MakeUpListViewController.swift
//  Cosmetics
//
//  Created by Alisa Ts on 30.11.2021.
//

import UIKit

class MakeUpListViewController: UITableViewController {

    @IBOutlet var activitiIndicator: UIActivityIndicatorView!
    
    private var makeUps: MakeUp = []
    private var filtredMakeUps = [MakeUpElement]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltring: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activitiIndicator.startAnimating()
        activitiIndicator.hidesWhenStopped = true
        
        tableView.rowHeight = 100
        
        fetchMakeUp(from: Link.cosmetics.rawValue)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltring {
            return filtredMakeUps.count
        }
        return makeUps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        var makeUp: MakeUpElement
        
        if isFiltring {
            makeUp = filtredMakeUps[indexPath.row]
        } else {
            makeUp = makeUps[indexPath.row]
        }
        
        cell.configure(with: makeUp)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailViewController else { return }
            
            var makeUp: MakeUpElement
            
            if isFiltring {
                makeUp = filtredMakeUps[indexPath.row]
            } else {
                makeUp = makeUps[indexPath.row]
            }
            
            detailsVC.dataMakeUp = makeUp
        }
    }
    
    private func fetchMakeUp(from url: String?) {
        NetworkManager.shared.fetchMakeUp(from: url) { makeUps in
            self.makeUps = makeUps
            self.tableView.reloadData()
        }
    }
}

extension MakeUpListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filtredMakeUps = makeUps.filter({ (makeUp: MakeUpElement) -> Bool in
            return makeUp.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
