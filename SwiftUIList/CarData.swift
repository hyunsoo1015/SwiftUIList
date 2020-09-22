import Foundation
import SwiftUI

//파일 경로를 받아서 JSON 파싱을 수행한 후 Car의 배열로 리턴하는 메소드
func loadJSON<T: Decodable>(_ filename: String) -> T {
    let data: Data
    //파일의 존재 여부 확인
    //프로젝트에 포함된 파일 가져오기
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename) not found")
    }
    
    //파일의 내용을 Data로 변환
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cound not load \(filename):(error)")
    }
    
    //json 파싱
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Cound not parsing \(filename):(error)")
    }
}

var carData:[Car] = loadJSON("carData.json")
