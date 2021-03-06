

import Foundation
import RxSwift

class AlgorithmsStorage: Storage {
    let algorithmsFileName = "algorithmsFileName"
    let cacheDirectory = Directory.caches
    
    func getCachedData() -> Single<[AlgorithmItem]> {
        return Single<[AlgorithmItem]>.create { single in
            single(.success(
                self.retrieve(
                    self.algorithmsFileName, from: self.cacheDirectory, as: [AlgorithmItem].self)))
            return Disposables.create {}
        }
    }
    
    func isCacheExist() -> Bool {
        return isFileExist(fileName: algorithmsFileName, from: cacheDirectory)
    }
    
    func cacheData(_ items:[AlgorithmItem]) {
        store(items, to: cacheDirectory, as: algorithmsFileName)
    }
}
