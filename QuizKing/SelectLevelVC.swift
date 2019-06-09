import Foundation

import UIKit

class SelectLevelVC: UIViewController {
 
    @IBOutlet weak var coinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func toTitle(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 設定某些元素樣式
    func setView () {
        coinLabel.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        coinLabel.layer.shadowRadius = 2
        coinLabel.layer.shadowOpacity = 0.5
        coinLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        coinLabel.layer.masksToBounds = false
    }
}
