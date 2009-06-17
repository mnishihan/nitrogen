% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_table).
-include ("wf.inc").
-compile(export_all).

reflect() -> record_info(fields, table).

render_element(HtmlID, Record, Context) -> 
	Rows = Record#table.rows,
	
	Elements = wf_tags:emit_tag(table, Rows, [
		{id, HtmlID},
		{border, 0},
		{cellpadding, 0},
		{cellspacing, 0},
		{class, [table, Record#table.class]},
		{style, Record#table.style}
	]),
	
	{ok, Elements, Context}.