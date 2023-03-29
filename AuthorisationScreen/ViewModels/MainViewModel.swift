//
//  MainViewModel.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 17.03.2023.
//

import Foundation
import Combine

class MainViewModel {
    var latestArray = CurrentValueSubject<[LatestElement], Never>([])
    var flashArray = CurrentValueSubject<[FlashSaleElement], Never>([])
}
