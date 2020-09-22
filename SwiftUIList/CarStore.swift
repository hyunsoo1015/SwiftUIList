import Foundation
import Combine

class CarStore: ObservableObject {
    //게시할 데이터를 생성
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
