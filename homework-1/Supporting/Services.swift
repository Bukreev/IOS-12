

import Foundation

class Services {
    static var feedProvider: FeedDataProvider = {
        return FeedDataProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
    
    static var feedItemsProvider: AlgorithmItemsProvider = {
        return AlgorithmItemsProvider(
            namesWithTest: FeedDataProvider().feedData(),
            namesWithoutTest: AlgoProvider().all)
    }()
}
