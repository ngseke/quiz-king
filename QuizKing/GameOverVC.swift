import Foundation
import UIKit

class GameOverVC: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    
    var score = 0
    var coin = 0
    var difficulty = "easy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        setCoin(level: difficulty)
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
        var coins = 100
        if let savedCoins = UserDefaults.standard.object(forKey: "coins") as? Int {
            coins = savedCoins
        }
        UserDefaults.standard.set(coins + coin, forKey: "coins")
    }
    
}
