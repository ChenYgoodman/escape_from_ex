(define (domain escape-from-ex)
  (:requirements :strips :typing)

  (:types
    room - object
    entity - object
  )

  (:predicates
    (at ?entity - entity ?room - room)           ; 实体在某个房间
    (connected ?from - room ?to - room)          ; 房间连接关系
    (player-at ?room - room)                     ; 玩家位置
    (memory-zone ?room - room)                   ; 回忆区域
    (near-exit ?room - room)                     ; 靠近出口
    (mood-calm)                                  ; 平静
    (mood-angry)                                 ; 愤怒
    (mood-chaser)                                ; 追逐
    (mood-emotional)                             ; 情绪化
  )

  ;; Action 1: 基础移动到任意相邻房间
  (:action move-to
    :parameters (?ex - entity ?from - room ?to - room)
    :precondition (and
      (at ?ex ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?ex ?from))
      (at ?ex ?to)
    )
  )

  ;; Action 2: 移动到玩家所在房间（追逐）
  (:action chase-to-player
    :parameters (?ex - entity ?from - room ?to - room)
    :precondition (and
      (at ?ex ?from)
      (connected ?from ?to)
      (player-at ?to)
      (mood-chaser)
    )
    :effect (and
      (not (at ?ex ?from))
      (at ?ex ?to)
    )
  )

  ;; Action 3: 移动到出口附近（封锁）
  (:action block-exit
    :parameters (?ex - entity ?from - room ?to - room)
    :precondition (and
      (at ?ex ?from)
      (connected ?from ?to)
      (near-exit ?to)
      (mood-angry)
    )
    :effect (and
      (not (at ?ex ?from))
      (at ?ex ?to)
    )
  )

  ;; Action 4: 移动到回忆区
  (:action go-to-memory
    :parameters (?ex - entity ?from - room ?to - room)
    :precondition (and
      (at ?ex ?from)
      (connected ?from ?to)
      (memory-zone ?to)
      (mood-emotional)
    )
    :effect (and
      (not (at ?ex ?from))
      (at ?ex ?to)
    )
  )
)
