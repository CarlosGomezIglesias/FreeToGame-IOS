//
//  ViewController.swift
//  FreeToGame-IOS
//
//  Created by Tardes on 28/5/26.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    var gameList: [Game] = []
    var originalGameList: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Game..."
        navigationItem.searchController = searchController
        
        //llamada a la api, hay que llamarla con await por que es una funcion asincrona
        Task {
            originalGameList = await GameService.getGamesList()
            gameList = originalGameList
            
            //le decimos que lo pase al hilo pricipal y recargue los datos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    //funcion que dice el numero de filas que hay
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = gameList[indexPath.row]                                         // el "as" es como decirle que lo vea como                                                                                      un GameViewCell no como un tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        cell.render(with: game)
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            //$0 es como el it en android
            //otra forma de escribirlo:
            //gameList = originalGameList.filter {game in
            //game.title.lowercased().contains(searchText.lowercased()) }"
            gameList = originalGameList.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            
            tableView.reloadData()
        }else {
            gameList = originalGameList
            
        }
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        gameList = originalGameList
        tableView.reloadData()
    }
    //funcion para preparar los datos para mandar al detalle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailViewController = segue.destination as! DetailViewController
        //creamos variable de la celda pulsada
        let IndexPath = tableView.indexPathForSelectedRow!
        detailViewController.game = gameList[IndexPath.row]
        //para deselecionar la celda pulsada
        tableView.deselectRow(at: IndexPath, animated: true)
    }
    


}

