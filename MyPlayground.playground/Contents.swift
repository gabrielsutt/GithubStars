import UIKit

class Teste {

    func identifica() {
        let input: [String] = ["A", "A", "A", "A", "B", "B", "B", "C", "C", "D", "A", "R", "A", "Z"]
        var output: [String] = []
        //    output <- A4B3C2D1A2

        var currentCharacter = input.first ?? ""
        var count = 0
        for character in input {
            if currentCharacter == character {
                count += 1
            } else {
                output.append("\(currentCharacter)\(count)")
                currentCharacter = character
                count = 1
            }
        }
        output.append("\(currentCharacter)\(count)")

        print(output)
    }
}

let teste = Teste()
teste.identifica()


