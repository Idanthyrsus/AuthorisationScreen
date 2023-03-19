
import Foundation
import UIKit
import Combine

class ProfileViewModel {
    var publisher = CurrentValueSubject<[ProfileDataSource], Never>(ProfileDataSource.dataSourceArray)
}
