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
        var coins = 0
        if let savedCoins = UserDefaults.standard.object(forKey: "coins") as? Int {
            coins = savedCoins
        }
        UserDefaults.standard.set(coins + coin, forKey: "coins")
    }
    @IBAction func share(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: ["我在 Quiz King 中獲得了 " + String(score) + " 分，厲害吧！尼要不要也來玩玩看？", "https://quizking.com/"], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
