/// @description event_register
/// @arg event, event's id (enum)
/// @arg listener, listener of the event
/// @arg script, performed when events is fired
/// @arg args...*, script's argument

/// Structure
///
/// event_1 = {
///		[listener_1, script, arg1, ..., argN],
///		[listener_2, script, arg1, ..., argN]
/// }
///
/// event_2 = {
///		[listener_1, script, arg1, ..., argN]
/// }
///

with (event_manager_obj)
{
	var event = argument[0];
	var listener = argument[1];
	
	if (!ds_map_exists(event_map, event))
	{
		var listeners = ds_list_create();
		ds_map_add_list(event_map, event, listeners);
	}
	else
	{
		var listeners = event_map[? event];
	}
	
	var listener_info;
	listener_info[0] = listener;
	
	var args_len = argument_count - 2;
	for (var i = 0; i < args_len; i++)
		listener_info[i+1] = argument[i+2];
	
	ds_list_add(listeners, listener_info);
}
