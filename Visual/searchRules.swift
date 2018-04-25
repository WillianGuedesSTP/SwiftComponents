    func searchRules(_ element: String, _ sender: String) -> Bool{
        var isCorrect: Bool
        isCorrect = element.lowercased().replacingOccurrences(of: " ", with: "").contains(sender.lowercased().replacingOccurrences(of: " ", with: ""))
        return isCorrect
    }
