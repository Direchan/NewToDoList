
import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let imageNames = ["picture", "picture-1", "picture-2", "picture-3", "picture-4", "picture-5", "picture-6"]
    
    var numberOfItems: Int {
            return imageNames.count
        }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 레이아웃
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let numberOfColumns: CGFloat = 3
            let width = (frame.size.width - (numberOfColumns - 1)) / numberOfColumns
            flowLayout.itemSize = CGSize(width: width, height: width)
//            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = UIImageView(image: UIImage(named: imageNames[indexPath.item]))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        
        return cell
    }
    
}
