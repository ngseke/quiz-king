import Foundation
import UIKit
import WebKit

class LoadingVC: UIViewController {
    // 透過 API 載入題庫
    func loadGame (amount: Int, difficulty: String, done: @escaping ([Question]) -> ()) {
        let address = String(format: "https://opentdb.com/api.php?amount=%d&difficulty=%@&type=multiple", amount, difficulty)
        var questions = [Question]()
        
        if let url = URL(string: address) {
            
            let session  = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, res, err) in
                if err != nil {
                    print("error")
                    return
                }
                if let okData = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: okData, options: []) as? [String:Any] {
                            if let myResult = json["results"] as? [[String:Any]] {
                                for item in myResult {
                                    let newQuestion = Question(
                                        category: item["category"] as! String,
                                        question: item["question"] as! String,
                                        correctAnswer: item["correct_answer"]  as! String,
                                        incorrectAnswers: item["incorrect_answers"] as! [String]
                                    )
                                    questions.append(newQuestion)   // 在陣列中插入一題題目
                                }
                            }
                            done(questions)     // 呼叫 callback 函式
                        }
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGame (amount: 10, difficulty: "easy") { (questions: [Question]) -> () in
            print("題庫載入完成!")
            questions.forEach({ (item) in
                print(item.question)
            })
        }
    }
    


}

