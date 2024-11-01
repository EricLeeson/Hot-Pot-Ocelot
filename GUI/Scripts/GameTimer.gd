extends Label

var time = 0
var minutes
var seconds

func update_time(argtime = 0):
	time = argtime
	minutes = int(time / 60.0)
	seconds = time % 60
	
	text = time_to_string(minutes, seconds)
	
func time_to_string(min, sec):
	var min_str = str(min)
	var sec_str = str(sec)
	if sec < 10:
		sec_str = "0" + sec_str
		
	var time_string = min_str + ":" + sec_str
	
	return time_string


func _on_timer_timeout() -> void:
	time += 1
	update_time(time)
