(define (problem escape-from-ex-test)
  (:domain escape-from-ex)

  (:objects
    bedroom hallway living_room kitchen storage doorway exit - room
    ex - entity
  )

  (:init
    ; 房间连接（双向）
    (connected bedroom hallway)
    (connected hallway bedroom)
    (connected hallway living_room)
    (connected living_room hallway)
    (connected living_room storage)
    (connected storage living_room)
    (connected hallway kitchen)
    (connected kitchen hallway)
    (connected hallway storage)
    (connected storage hallway)
    (connected storage doorway)
    (connected doorway storage)
    (connected doorway exit)
    (connected exit doorway)

    ; 特殊房间标记
    (memory-zone living_room)
    (near-exit doorway)
    (near-exit storage)

    ; 初始位置
    (at ex living_room)
    (player-at bedroom)

    ; 初始情绪
    (mood-calm)
  )

  (:goal
    ; EX的目标：移动到走廊
    (at ex hallway)
  )
)
