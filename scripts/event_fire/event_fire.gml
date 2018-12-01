/// @description event_fire
/// @arg event, event's id (enum)


with (event_manager_obj)
{
	var event = argument0;
	
	if (!ds_map_exists(event_map, event))
		return;
		
	var listeners     = event_map[? event];
	var listeners_len = ds_list_size(listeners);

	for (var i = 0; i < listeners_len; i++)
	{
		var listener_info = listeners[|i];
		var listener      = listener_info[0];
		var script        = listener_info[1];		
		var args_len      = array_length_1d(listener_info) - 2;
		var unregister    = false;
		
		if (instance_exists(listener))
		{
			if (args_len <= 0)
			{
				with (listener)
					unregister = script_execute(script);
			}
			else
			{
				var args = array_create(args_len, 0);
				array_copy(args, 0, listener_info, 2, args_len);
				
				with (listener)
					unregister = script_execute_alt(script, args);
			}
		}
		else
		{
			// If listener does not exists, unregister relative event
			unregister = true;
		}

		if (unregister)
			event_unregister(event, listener);
	}
}