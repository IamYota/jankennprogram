//CPをコンピューターとし、グー、チョキ、パーが入った配列からrandomを用いてどれかを選択させる
//自身でインスタンス化したクラスに.Rock, .Scissors, .Paperを渡し、randomに選択されたものと比較
//switch文で組み合わせ別に勝ち、負け、あいこをString型でreturnさせる処理を記述

import UIKit

class Jankenn {
    
    var jankenns = ["グー", "チョキ", "パー"]
    
    enum JankennType {
        case Rock
        case Scissors
        case Paper
    }
    
    //cp側
    func cpSelects() -> JankennType { //戻り値にenumのどれかを返させる
        let randomChoice = jankenns.randomElement() ?? ""
        switch randomChoice {
        case "グー":
            return .Rock
        case "チョキ":
            return .Scissors
        case "パー":
            return .Paper
        default:
            fatalError("Invalid choice")
        }
    }
    
    // JankennType を文字列に変換
    func jankennToString(type: JankennType) -> String {
        switch type {
        case .Rock:
            return "グー"
        case .Scissors:
            return "チョキ"
        case .Paper:
            return "パー"
        }
    }
    
    //cpの選択は内部でランダムに決め、playerの選択を引数として受け取る
    func results(player: JankennType) -> String {
        let cp = cpSelects()
        if cp == player {
            return "CPは\(jankennToString(type: cp))を出しました。あいこ"
        }
        
        switch (cp, player) {
        case (.Rock, .Scissors), (.Scissors, .Paper), (.Paper, .Rock):
            return "CPは\(jankennToString(type: cp))を出しました。CPの勝ち"
        default:
            return "CPは\(jankennToString(type: cp))を出しました。プレイヤーの勝ち"
        }
    }
}

let jankenn = Jankenn()
print(jankenn.results(player: .Rock))

