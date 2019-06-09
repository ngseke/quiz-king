import Foundation
import UIKit

class GameOverVC: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    
    var score = 0
    var coin = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        setCoin(level: "easy")
    }
    
    
    func setCoin (level: String) {
        switch level {
        case "easy":
            coin = Int(Double(score) * 0.5)
        case "medium":
            coin = Int(Double(score) * 0.7)
        case "hard":
            coin = Int(Double(score) * 1)
        default:
            coin = score
        }
        coinLabel.text = String(coin)
        
    }
    
}
