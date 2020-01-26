

import Foundation
import RxSwift

class TimerItemsRepository {
    
    
    private let itemsCount:Int
    var launchedTimers: [Int:TimerItem] = [:]
    var pausedTimers: [Int:TimerItem] = [:]
    var timers:[TimerItem] = []
    
    init(count: Int = 30) {
        self.itemsCount = count
    }
    
    func getRemoteAlgorithmItems() -> Single<[TimerItem]> {
        return Single<[TimerItem]>.create { single in
            for _ in 0...self.itemsCount {
                self.timers.append(TimerItem())
            }
            single(.success(self.timers))
            return Disposables.create {}
        }
    }
    
    func resetData()  {
        
    }
    
}
