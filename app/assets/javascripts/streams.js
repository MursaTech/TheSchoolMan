function submit_modal_form(form) {
	$(form)
	.modal('setting', {
	  onApprove: function(){
	    $(this).find('form').submit();
	  }
	})
	.modal('show');
}

$(function() {
	// $('#example').dataTable( {
 //      "aaSorting": [[ 4, "desc" ]]
 //  } );

	$('#toggle_streams').change(function(e) {
	  if (this.checked) {
	    $('.streams_table').checkboxes('check');
	    e.preventDefault();
	  }
	  else {
	    $('.streams_table').checkboxes('uncheck');
	    e.preventDefault();
	  }
	});

	$('#delete-streams').click(function(){
	  if ($(".streams_table input:checked").length < 1)
	  {
	    alert("You have not selected any streams to be deleted.");
	    return false;
	  }
	  else
	  {
	    streams_array = []
	    $(".streams_table input:checked").each(function(){
	      streams_array.push($(this).attr('value'))
	    });
	    $('#delete_streams').val(streams_array);
	    // contact_num = ("#streams_table input:checked").length;
	    $('#delete_stream_modal #lbl-msg').html('You are about to delete '+String(streams_array.length)+' streams');
	    $('#delete_stream_modal')
	    .modal('setting', {
	      onApprove: function(){
	        $(this).find('form').submit();
	      }
	    })
	    .modal('show');
	  }
	});

	$('#assign_teacher').click(function(){
	  if ($(".streams_table input:checked").length < 1)
	  {
	    alert("You have not selected any streams to be deleted.");
	    return false;
	  }
	  else
	  {
	    streams_array = []
	    $(".streams_table input:checked").each(function(){
	      streams_array.push($(this).attr('value'))
	    });
	    $('#stream').val(streams_array);
	    // contact_num = ("#streams_table input:checked").length;
	    $('#assign_teacher_modal #lbl-msg').html('You are about to delete '+String(streams_array.length)+' streams');
	    $('#assign_teacher_modal')
	    .modal('setting', {
	      onApprove: function(){
	        $(this).find('form').submit();
	      }
	    })
	    .modal('show');
	  }
	});

	$('#assign_prefect').click(function(){
	  if ($(".streams_table input:checked").length < 1)
	  {
	    alert("You have not selected any streams to be deleted.");
	    return false;
	  }
	  else if($(".streams_table input:checked").length > 1) {
	  	alert("You can only select one for this operation.")
	    return false;
	  }
	  else
	  {
	  	$('select[name=prefect]').empty();
	  	$.get('/streams/'+ $(".streams_table input:checked").val() + '.json', function(data) {
	  		for (var i = 0; i < data['students'].length; i++) {
	  			$('select[name=prefect]').append('<option value='+data['students'][i]['id']+'>'+data['students'][i]['name']+'</option>');
	  		};
	  	})
	    streams_array = []
	    $(".streams_table input:checked").each(function(){
	      streams_array.push($(this).attr('value'))
	    });
	    $('#assign_prefect_modal #stream').val(streams_array);
	    // contact_num = ("#streams_table input:checked").length;
	    $('#assign_prefect_modal #lbl-msg').html('You are about to delete '+String(streams_array.length)+' streams');
	    $('#assign_prefect_modal')
	    .modal('setting', {
	      onApprove: function(){
	        $(this).find('form').submit();
	      }
	    })
	    .modal('show');
	  }
	});

	$('#add_to_class').click(function(){
	  if ($(".streams_table input:checked").length < 1)
	  {
	    alert("You have not selected any streams.");
	    return false;
	  }
	  else
	  {
	    streams_array = []
	    $(".streams_table input:checked").each(function(){
	      streams_array.push($(this).attr('value'))
	    });
	    $('#streams').val(streams_array);
	    // contact_num = ("#streams_table input:checked").length;
	    $('#class_modal #lbl-msg').html('Select from the dropdown below:');
	    submit_modal_form('#class_modal')
	  }
	});

	$('#new_class').click(function() {
		submit_modal_form('#new_class_modal')
	});

	$('#new_stream').click(function() {
		submit_modal_form('#new_stream_modal')
	});
});