

import Foundation

class AlgorithmItem: Codable {
    let name: String
    var cellBackground: String
    
    init(name: String, cellBackground: String) {
        self.name = name
        self.cellBackground = cellBackground
    }
}
