import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ArtCell"
    
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var artNameLabel: UILabel!
    
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.layer.borderWidth = 1
                toggleSelection()
                print(isSelected)
                
            } else {
                
                self.transform = CGAffineTransform.identity
                
            }
        }
    }
    
    func toggleSelection() {
        self.isSelected = !self.isSelected
    }
    
}
