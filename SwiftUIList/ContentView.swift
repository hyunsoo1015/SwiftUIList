import SwiftUI

//List에 출력할 하나의 셀
struct ListCell: View {
    var car: Car //출력할 데이터
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            
        HStack {
            Image(car.imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 60)
            Text(car.name)
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var carStroe: CarStore = CarStore(cars: carData)
    var body: some View {
        NavigationView {
            List {
                ForEach(carStroe.cars) {
                    car in ListCell(car: car)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
