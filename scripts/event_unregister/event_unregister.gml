/// @description event_unregister
/// @arg event, event's id (enum)
/// @arg listener, listener of the event

with (event_manager_obj)
{
	var event = argument[0];
	var listener = argument[1];
	
	if (!ds_map_exists(event_map, event))
		return;

	var listeners = event_map[? event];
	var listeners_len = ds_list_size(listeners);

	for (var i = listeners_len - 1; i >= 0; i--)
	{
		var listener_info = listeners[|i];
		if (listener_info[0] == listener)
		{
			if (listeners_len == 1)
			{
				ds_list_destroy(listeners);
				ds_map_delete(event_map, event);
			}
			else
			{
				ds_list_delete(listeners, i);
			}

			break;
		}
	}
}