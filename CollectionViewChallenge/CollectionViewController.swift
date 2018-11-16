import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    //var imageInfo: [String] = []
    
    var targetDimension: CGFloat = 320
    var insetAmount: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1 ... 15 {
            
            let imageName = "Image\(index)"
            guard let image = UIImage(named: imageName) else { return }
            images.append(image)
            print (imageName)
        }
        
        for index in 1 ... 15 {
            var imageInfo = "Image\(index)"
            imageInfo.append(imageInfo)
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let collectionLayout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Error casting collection view layout") }
        collectionLayout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        collectionLayout.minimumLineSpacing = .greatestFiniteMagnitude
        collectionLayout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("Error could not dequeue collection view cell") }

        cell.artImageView.image = images[indexPath.item]
        //cell.artNameLabel.text = Model.shared.imageInfo[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = images[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
    
}
