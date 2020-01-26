

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var runTestsButton: UIBarButtonItem!
    
    @IBAction func runTestsClicked(_ sender: Any) {
        viewModel.runTasks()
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var viewModel = FeedViewModel(
        repository: AlgorithmRepository(
            storage: AlgorithmsStorage(),
            provider: Services.feedItemsProvider)
    )
    
    var isSearchBarEmpty: Bool {
        guard let query = searchController.searchBar.text else {
            return true
        }
        return query.isEmpty
    }
    
    var isFiltered: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Algorithm"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        viewModel.bind{[unowned self] (state) in
            switch(state){
            case .result:
                self.tableView.reloadData()
                self.runTestsButton.isEnabled = !self.viewModel.testsRunned
                break
            default:
                break
            }
        }
    }
}
