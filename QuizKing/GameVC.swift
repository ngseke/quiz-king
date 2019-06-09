import Foundation
import UIKit

class GameVC: UIViewController {
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    
    let defaultSeconds = 5  // 預設秒數
    
    var timer: Timer?
    var seconds = 0
    var questions = [Question]()
    var currentQuestionIndex: Int = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if (currentQuestionIndex < questions.count) {
            // 跳至下一題
            currentQuestionIndex += 1
            setView()
        } else {
            // 遊戲結束
        }
    }
    
    func setView () {
        questionLabel.text = questions[currentQuestionIndex].question
        optionButton1.setTitle(questions[currentQuestionIndex].selectionList[0], for: .normal)
        optionButton2.setTitle(questions[currentQuestionIndex].selectionList[1], for: .normal)
        optionButton3.setTitle(questions[currentQuestionIndex].selectionList[2], for: .normal)
        optionButton4.setTitle(questions[currentQuestionIndex].selectionList[3], for: .normal)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        clearTimer()
    }
    
}
