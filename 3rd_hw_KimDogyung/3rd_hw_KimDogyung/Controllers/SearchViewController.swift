import UIKit

class SearchViewController: UIViewController {
    
    var searchData = SearchModel.modeling
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Search for a show, movie, genre, etc."
        bar.searchBarStyle = .minimal
        bar.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return bar
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Searches"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26.75, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.register(SearchImageTableViewCell.self, forCellReuseIdentifier: SearchImageTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    private let searchController: UISearchController = {
//        let controller = UISearchController(searchResultsController: nil)
//        controller.searchBar.placeholder = "Search for a show, movie, genre, etc."
//        controller.obscuresBackgroundDuringPresentation = false
//        return controller
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
        setConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false // Ensure search bar is always visible
//        definesPresentationContext = true // Important to avoid search controller lingering between screens
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData() // Ensure table view is reloaded after the view is in the hierarchy
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), // Align to the top
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13), // Padding from the left
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15), // Padding from the right
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12.88),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 21),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Test"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchImageTableViewCell.identifier, for: indexPath) as? SearchImageTableViewCell else {return UITableViewCell()}
        
        // Get the corresponding SearchModel object
        let searchItem = searchData[indexPath.row]
                
        // Set the cell's image and title using the SearchModel data
        cell.configure(with: searchItem)
                
        return cell
    }
    
    //cell 의 높이는 76인데 cell 사이의 공간을 위해 3을 더 줌
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
    
    // cell 사이의 공간 주는 함수인데 아직 이해를 못함
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let margin: CGFloat = 3 // Gap between cells
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: margin/2)
        cell.layer.mask = maskLayer
    }
        
    
    
}
