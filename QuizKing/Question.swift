//
// 是一道題目的物件
//

import Foundation

// 擴展 String 讓他可以轉換 html 字串
extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}


class Question {
    let question:String             // 題目文字
    let correctAnswer:String        // 正確答案
    let incorrectAnswers:[String]   // 錯誤答案
    let category:String             // 題目類型
    var selectionList:[String]      // 選項列表
    var isCorrect:Bool? = nil       // nil: 未答; true: 正確; false: 答錯
    
    init(category:String, question: String, correctAnswer:String, incorrectAnswers:[String]) {
        self.question = question.html2String
        self.correctAnswer = correctAnswer.html2String
        self.incorrectAnswers = incorrectAnswers
        self.category = category
        //
        self.selectionList = [self.correctAnswer] + self.incorrectAnswers
    }
    
    // 作答
    func giveAnswer (answerOfUser: String) {
        self.isCorrect = answerOfUser == self.correctAnswer
    }
    
}
