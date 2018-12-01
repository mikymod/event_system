// Game Events
enum GameEvent
{
	Play,
	Pause
}

// Register events... they will be triggered in step
event_register(GameEvent.Play, id, play_script);
event_register(GameEvent.Pause, id, pause_script);

pause = false;
