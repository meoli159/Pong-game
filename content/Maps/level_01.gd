extends Control
var score := [0,0]
@onready var player_posision_y = $Player.position.y
@onready var enemy_posision_y = $Enemy.position.y
func _on_ball_timer_timeout() -> void:
	$Ball.new_ball()

func _on_top_body_entered(body: Node2D) -> void:
	if body.name == "Ball": 
		score[0] += 1
		$CanvasGroup/EnemyScore.text = str(score[0])
		$BallTimer.start()

func _on_bottom_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score[1] += 1
		$CanvasGroup/PlayerScore.text = str(score[1])
		$BallTimer.start()
