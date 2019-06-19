import Foundation
import UIKit

class AboutVC: UIViewController {
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func reset(_ sender: UIButton) {
        UserDefaults.standard.set(94408, forKey: "coins")
    }
}
