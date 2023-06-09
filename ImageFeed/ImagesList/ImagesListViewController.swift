import UIKit

class ImagesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map({"\($0)"})
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource  = self
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        let photoName = photosName[indexPath.row]
        guard let image = UIImage(named: photoName) else {
            print("Failed to load image")
            return
        }
        
        let isActive = indexPath.row % 2 == 0
        let favoritesImage = isActive ? UIImage(named: "FavoritActive") : UIImage(named: "FavoritNoActive")
        
        let currentDate = dateFormatter.string(from: Date())
        
        cell.cellImage.image = image
        cell.likeButton.setImage(favoritesImage, for: .normal)
        cell.dateLabel.text = currentDate
    }
    
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier,
            for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            print("ImageListCell is nil.")
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        
        return imageListCell
    }
}
