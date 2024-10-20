import UIKit

class SearchViewController: UIViewController {
    
    var searchData = SearchModel.modeling
    
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
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search for a show, movie, genre, etc."
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a show, movie, genre, etc."
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        navigationItem.titleView = searchBar
        setConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
//            searchBar.leadingAnchor.constraint(equalTo: navigationItem.titleView!.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: navigationItem.titleView!.trailingAnchor),
//            searchBar.topAnchor.constraint(equalTo: navigationItem.titleView!.topAnchor),
//            searchBar.bottomAnchor.constraint(equalTo: navigationItem.titleView!.bottomAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
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
        
    // cell을 선택했을때 다른 화면으로 넘어감
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
