import Foundation
import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let defaultSeconds = 10     // 預設秒數
    
    var timer: Timer?
    var seconds = 0
    var questions = [Question]()
    var currentQuestionIndex: Int = 0
    var score = 0
    var difficulty = "easy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondsLabel.layer.cornerRadius = secondsLabel.frame.width / 2
        
        resetTimer()
        setView()
    }
    
    // 重設timer
    func resetTimer () {
        clearTimer()
        seconds = defaultSeconds
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        secondsLabel.text = String(seconds)
    }
    
    // 將timer的執行緒停止
    func clearTimer () {
        if self.timer != nil {
            self.timer?.invalidate()
        }
    }
    
    // 每過一秒
    @objc func timerTick () {
        seconds -= 1
        secondsLabel.text = String(seconds)
        
        // 若時間到
        if (seconds < 0) {
            resetTimer()
            goToNextQuestion()
        }
    }
    
    
    func goToNextQuestion () {
        if (currentQuestionIndex < questions.count - 1) {
            // 跳至下一題
            currentQuestionIndex += 1
            setView()
            print("🍿 這題的正解是:" + questions[currentQuestionIndex].correctAnswer)
        } else {
            // 遊戲結束
            clearTimer()
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "gameOverSegue", sender: self)
            }
        }
    }
    
    func giveAnswer (question: Question, selectionOfUser: UIButton) {
        if let text = selectionOfUser.titleLabel?.text {
            if (question.giveAnswer(answerOfUser: text)) {
                // 答對
                addScore()
            } else {
                // 答錯
            }
        }
        goToNextQuestion()
        resetTimer()
    }
    
    // 加分
    func addScore () {
        self.score += self.seconds
        self.scoreLabel.text = String(self.score)
    }
    
    @IBAction func clickOptionButton1(_ sender: Any) {
        giveAnswer(question: questions[currentQuestionIndex], selectionOfUser: sender as! UIButton)
    }
    
    @IBAction func clickOptionButton2(_ sender: Any) {
        giveAnswer(question: questions[currentQuestionIndex], selectionOfUser: sender as! UIButton)
    }
    
    @IBAction func clickOptionButton3(_ sender: Any) {
        giveAnswer(question: questions[currentQuestionIndex], selectionOfUser: sender as! UIButton)
    }
    
    @IBAction func clickOptionButton4(_ sender: Any) {
        giveAnswer(question: questions[currentQuestionIndex], selectionOfUser: sender as! UIButton)
    }
    
    func setView () {
        categoryLabel.text = questions[currentQuestionIndex].category
        questionLabel.text = questions[currentQuestionIndex].question
        optionButton1.setTitle(questions[currentQuestionIndex].selectionList[0], for: .normal)
        optionButton2.setTitle(questions[currentQuestionIndex].selectionList[1], for: .normal)
        optionButton3.setTitle(questions[currentQuestionIndex].selectionList[2], for: .normal)
        optionButton4.setTitle(questions[currentQuestionIndex].selectionList[3], for: .normal)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        clearTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? GameOverVC
        controller?.score = score
        controller?.difficulty = difficulty
    }
}
