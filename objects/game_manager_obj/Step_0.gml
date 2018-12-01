// Pause the game
if (keyboard_check_pressed(vk_escape))
{
	if (pause)
		event_fire(GameEvent.Play);
	else
		event_fire(GameEvent.Pause);
}

