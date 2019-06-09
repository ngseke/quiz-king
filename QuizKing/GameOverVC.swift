import Foundation
import UIKit

class GameOverVC: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
    }
    
}
