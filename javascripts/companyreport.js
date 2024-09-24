

function populatecompany(companyMap, id, select)
{
	var ob = companyMap[id];
	
	var options = select.options;
	options.length = 0;
	
	var all = new Option("all", "");
	options[options.length] = all;
	
	for (var i = 0; i < ob.length; i++)
	{
		var dept = ob[i];
		var dopt = new Option(dept.name, dept.id);
		options[options.length] = dopt;
	}
}