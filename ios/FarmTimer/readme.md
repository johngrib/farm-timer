# FarmTimer for iOS

- iOS용 FarmTimer

1. 타이틀과 타이머 시작, 정지 버튼이 달린 셀을 리스트에 추가할 수 있다.
2. 타이머 리스트가 하나 이상일 경우 시작하지 않은 타이머의 시작버튼을 클릭시에 이미 동작하고 있는 타이머는 바로 정지한다.

## 구조
- Item(CoreData)
    - TimerItem
        - id
        - title
        - timer
        - play, pause state
        - remove menu
- Service
    - TimerService
        - timer source
        - start, pause function
    - TimerGroup
        - timer with id of timer item or directly own timer item
        - play, pause function for sub timers
- View
    - TimerListViewController
        - TimerListCell
