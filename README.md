# Capitals
Capitals developed with SwiftUI

### ScreenShot
<img src="https://github.com/MojitoBar/Capitals/blob/main/ScreenShot.gif" width="250"/>

### Skill
- @Binding, @ObservableObject
```Swift
class capital_Class: ObservableObject {
    @Published var capitals: [capital] = [
        ...
    ]
}
```

- ContentView.swift
```Swift
// ObservableObject 받아오기
@EnvironmentObject var capital_class: capital_Class

// 즐겨찾기 토글 버튼 변수
@State var showFavoritesonly = false

// filter로 filteredCapital에 저장
var filteredCapital: [capital] {
    capital_class.capitals.filter { _capital in
        // 체크가 false면 뒤 조건 검사 안하고 전부 통과, 체크가 true면 뒤 조건 검사
        (!showFavoritesonly || _capital.favorite)
    }
}
```

- CapitalInfo.swift
```Swift
// ObservableObject 받아오기
@EnvironmentObject var capital_class : capital_Class
// Binding 변수 isSet에 
FavoriteButton(isSet: $capital_class.capitals[capitalIndex].favorite)

...

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        ...
    }
}
```
