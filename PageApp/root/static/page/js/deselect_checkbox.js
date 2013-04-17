function uncheckOthers(field, curr_value)
{
for (i = 0; i < field.length; i++)
	if (field[i].checked && field[i].value != curr_value ) {
		field[i].checked = false ;
	}
}

