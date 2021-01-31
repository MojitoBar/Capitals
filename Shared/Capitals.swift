import CoreLocation
import Combine

final class capital_Class: ObservableObject {
    @Published var capitals: [capital] = [
        //37.55290395675317, 126.9884951747226
        capital(name: "Seoul",
                imageUrl: "seoul",
                position: capital.Coordinates.init(latitude: 37.55290395675317, longitude: 126.9884951747226),
                subtext: "Capital of South Korea",
                content: "Seoul, the capital of South Korea, is a huge metropolis where modern skyscrapers, high-tech subways and pop culture meet Buddhist temples, palaces and street markets. Notable attractions include futuristic Dongdaemun Design Plaza, a convention hall with curving architecture and a rooftop park; Gyeongbokgung Palace, which once had more than 7,000 rooms; and Jogyesa Temple, site of ancient locust and pine trees. ",
                favorite: true),
        //35.684831857060956, 139.76767206448557
        capital(name: "Tokyo",
                imageUrl: "tokyo",
                position: capital.Coordinates.init(latitude: 35.684831857060956, longitude: 139.76767206448557),
                subtext: "Capital of Japan",
                content: "Tokyo, Japan’s busy capital, mixes the ultramodern and the traditional, from neon-lit skyscrapers to historic temples. The opulent Meiji Shinto Shrine is known for its towering gate and surrounding woods. The Imperial Palace sits amid large public gardens. The city's many museums offer exhibits ranging from classical art (in the Tokyo National Museum) to a reconstructed kabuki theater (in the Edo-Tokyo Museum).",
                favorite: true),
        //38.91108155370155, -77.02827983286768
        capital(name: "Washington D.C",
                imageUrl: "washington",
                position: capital.Coordinates.init(latitude: 38.91108155370155, longitude: -77.02827983286768),
                subtext: "Capital of the United States of America",
                content: "Washington, DC, the U.S. capital, is a compact city on the Potomac River, bordering the states of Maryland and Virginia. It’s defined by imposing neoclassical monuments and buildings – including the iconic ones that house the federal government’s 3 branches: the Capitol, White House and Supreme Court. It's also home to iconic museums and performing-arts venues such as the Kennedy Center.",
                favorite: false)
    ]
}

struct capital: Hashable{
    let name : String
    let imageUrl : String
    let position : Coordinates
    let subtext : String
    let content : String
    var favorite : Bool
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: position.latitude,
            longitude: position.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}

//// capitals 함수 확장
//
//extension capital{
//    static func all() -> [capital]{
//        return[
//            //37.55290395675317, 126.9884951747226
//            capital(name: "Seoul",
//                    imageUrl: "seoul",
//                    position: Coordinates.init(latitude: 37.55290395675317, longitude: 126.9884951747226),
//                    subtext: "Capital of South Korea",
//                    content: "Seoul, the capital of South Korea, is a huge metropolis where modern skyscrapers, high-tech subways and pop culture meet Buddhist temples, palaces and street markets. Notable attractions include futuristic Dongdaemun Design Plaza, a convention hall with curving architecture and a rooftop park; Gyeongbokgung Palace, which once had more than 7,000 rooms; and Jogyesa Temple, site of ancient locust and pine trees. ",
//                    favorite: true),
//            //35.684831857060956, 139.76767206448557
//            capital(name: "Tokyo",
//                    imageUrl: "tokyo",
//                    position: Coordinates.init(latitude: 35.684831857060956, longitude: 139.76767206448557),
//                    subtext: "Capital of Japan",
//                    content: "Tokyo, Japan’s busy capital, mixes the ultramodern and the traditional, from neon-lit skyscrapers to historic temples. The opulent Meiji Shinto Shrine is known for its towering gate and surrounding woods. The Imperial Palace sits amid large public gardens. The city's many museums offer exhibits ranging from classical art (in the Tokyo National Museum) to a reconstructed kabuki theater (in the Edo-Tokyo Museum).",
//                    favorite: true),
//            //38.91108155370155, -77.02827983286768
//            capital(name: "Washington D.C",
//                    imageUrl: "washington",
//                    position: Coordinates.init(latitude: 38.91108155370155, longitude: -77.02827983286768),
//                    subtext: "Capital of the United States of America",
//                    content: "Washington, DC, the U.S. capital, is a compact city on the Potomac River, bordering the states of Maryland and Virginia. It’s defined by imposing neoclassical monuments and buildings – including the iconic ones that house the federal government’s 3 branches: the Capitol, White House and Supreme Court. It's also home to iconic museums and performing-arts venues such as the Kennedy Center.",
//                    favorite: false)
//        ]
//    }
//}
