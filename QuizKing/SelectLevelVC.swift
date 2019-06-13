import Foundation

import UIKit

class SelectLevelVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var difficultTableView: UITableView!
    var coins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        difficultTableView.dataSource = self
        setView(label: coinLabel)
        if let savedCoins = UserDefaults.standard.object(forKey: "coins") as? Int {
            coins = savedCoins
            coinLabel.text = String(coins)
        }
    }
    
    @IBAction func toTitle(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var difficultList = ["Easy", "Medium", "Hard"]
    var moneyList = [0, 20, 50]
//    var colorList = []
    
    // 設定某些元素樣式
    func setView (label:UILabel) {
        label.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.masksToBounds = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 有幾個Section
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 每個Section有幾個Row
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 每一列TableViewCell要顯示的資料
        // 先產出Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DifficultTableViewCell
        // 設定Cell的文字
        tableView.rowHeight = tableView.frame.height/CGFloat(difficultList.count)
//        tableView.rowHeight = 100
        cell.difficultLable.text = difficultList[indexPath.row]
        cell.moneyLable.text = moneyList[indexPath.row] == 0 ? "Free" : "$" + String(moneyList[indexPath.row])
        setView(label: cell.difficultLable!)
        setView(label: cell.moneyLable!)
        // 設定Cell的縮圖
        if moneyList[indexPath.row] > coins {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLoading" {
            let index = self.difficultTableView.indexPathForSelectedRow?.row
            (segue.destination as! LoadingVC).difficulty = difficultList[index!].lowercased()
                UserDefaults.standard.set(coins-moneyList[index!], forKey: "coins")
        }
    }
}
