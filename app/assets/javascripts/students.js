function populateStreams(form_id) {
  $("#streams").empty();
  $.ajax({
    type: "POST",
    url: '/forms_and_streams',
    dataType: 'json',
    data: { form: form_id},
    success: function(data, textStatus, jqXhr) {
      for (var i = 0; i < data.length; i++) {
        console.log(data[i])
        $("#streams").append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
      };
    }
  });
}

$(function() {
  if (window.location.pathname.indexOf("edit") >= 0 && window.location.pathname.indexOf("students") >= 0) {
    $.get(window.location.pathname.substring(0, (window.location.pathname.indexOf('edit') - 1)) + '.json', function(data) {
      $("#classes").val(data['stream']['form_id']);
      populateStreams($('select[id=classes]').val());
      $("#streams").val(data['stream']['id']);
      $("#parents").val(data.guardian_id);
      console.log(data['stream']['id'])
    })
  };
  $("#classes").change(function() {
    populateStreams($('select[id=classes]').val());
  })

  $("#parents").change(function() {
    // if ($('select[id=parents]').val() === "Guardian Not Listed? Fill in the details below:") {
    //   $("#guardian_name").removeProp('disabled');
    //   $("#guardian_id_no").removeProp('disabled');
    //   $("#guardian_number").removeProp('disabled');
    //   $("#guardian_address").removeProp('disabled');
    // }
    if($('#parents')[0].selectedIndex != 0 && $('#parents')[0].selectedIndex != 1) {
      $.ajax({
        type: "GET",
        url: '/guardians/' + $("#parents").val() + '.json',
        dataType: 'json',
        success: function(data, textStatus, jqXhr) {
          $("#guardian_name").val(data.name);
          $("#guardian_id_no").val(data.id_number);
          $("#guardian_number").val(data.phone_number);
          $("#guardian_address").val(data.address);
        }
      });
    }
  })
  $('#example').dataTable( {
      "aaSorting": [[ 4, "desc" ]]
  } );

  $('.datetimepicker').datetimepicker();

  $('#toggle_students').change(function(e) {
    if (this.checked) {
      $('.students_table').checkboxes('check');
      e.preventDefault();
    }
    else {
      $('.students_table').checkboxes('uncheck');
      e.preventDefault();
    }
  });

  $('.students #add_list').click(function(){
    if ($(".students #students_table input:checked").length < 1) {
      alert("You must select at least one contact to be added to the list.");
      return false;
    }
    else {
      var checked_students =[];
      $('#students_table input:checked').each(function(){
        checked_students.push($(this).attr('value'))
      });
      $('#list_modal span.amount').html(checked_students.length);
      $('#list_students').val(checked_students);
      $('#list_modal')
      .modal('setting', {
        closable: false,
        onApprove: function() {
          if ($('#list_modal input#list:hidden').val().length < 1)
          {
            alert('You have not seleted a list');
            return false;
          }
          else
          {
           $(this).find('form').submit();
         }
       }
     })
      .modal('show');
    }
  });
  $('#main_table tr .send_message').click(function(){
    name = $(this).parent().parent().find('td:nth-child(3)').text();
    phone_number = $(this).parent().parent().find('td:nth-child(5)').text();
    $('#send_message_modal input#phone_number:hidden').val(phone_number);
    $('#send_message_modal span.chosen').html('Send a message to '+ name);
    $('#send_message_modal')
    .modal('setting', {
      closable: true,
      onApprove: function(){
        if ($('#send_message_modal textarea').val().length < 1){
          alert('You have not entered a message');
          return false;
        }
        else{
          $(this).find('form').submit();
        }
      }
    })
    .modal('show');
  });

  $('#delete-students').click(function(){
    if ($(".students_table input:checked").length < 1)
    {
      alert("You have not selected any students to be deleted.");
      return false;
    }
    else
    {
      students_array = []
      $(".students_table input:checked").each(function(){
        students_array.push($(this).attr('value'))
      });
      $('#delete_students').val(students_array);
      // contact_num = ("#students_table input:checked").length;
      $('#delete_modal #lbl-msg').html('You are about to delete '+String(students_array.length)+' students');
      $('#delete_modal')
      .modal('setting', {
        onApprove: function(){
          $(this).find('form').submit();
        }
      })
      .modal('show');
    }
  });

  $('#add_to_class').click(function(){
    if ($(".students_table input:checked").length < 1)
    {
      alert("You have not selected any students.");
      return false;
    }
    else
    {
      students_array = []
      $(".students_table input:checked").each(function(){
        students_array.push($(this).attr('value'))
      });
      $('#students').val(students_array);
      // contact_num = ("#students_table input:checked").length;
      $('#class_modal #lbl-msg').html('You are about to add '+String(students_array.length)
        +' students to another class. Select from the dropdown below:');
      $('#class_modal')
      .modal('setting', {
        onApprove: function(){
          $(this).find('form').submit();
        }
      })
      .modal('show');
    }
  });

  $('#add_group').click(function(){
    if ($("#students_table input:checked").length < 1)
    {
      alert("You must select at least one contact to be added to the group");
      return false;
    }
    else
    {
      var checked_students =[];
      $('#students_table input:checked').each(function(){
        checked_students.push($(this).attr('value'))
      });
      $('#group_modal span.amount').html(checked_students.length);
      $('#group_students').val(checked_students);
      $('#new_group_students').val(checked_students);
      $('#group_modal')
      .modal('setting', {
        closable: false,
        onApprove: function() {
          if ($('#group_modal input:text').val().length < 1)
          {
            if ($('#group_modal input#group:hidden').val().length < 1)
            {
              alert('You have neither selected a group nor entered a new group name');
              return false;
            }
            else{
              $(this).find('form:first').submit();
            }
          }
          else
          {
            $(this).find('form').submit();
          }
        }
      })
      .modal('show');
    }
  });

  $('#new_contact').click(function(){
      $('#new_contact_modal')
      .modal('setting', {
        closable: false,
        onApprove: function() {
          $(this).find('form').submit();
        }
      })
      .modal('show');
  });
$('.infinite-table').infinitePages({
  loading: function() {
    $(this).text('Loading next page...'); 
  },
  success: function()
  {
  },
  error: function(err) {  
// $(this).button('There was an error, please try again');
}
});

  $('.students .infinite-table table').editableTableWidget(); 
  var elem = null;
  $('.students .infinite-table table td').on('change', function(evt, newValue) {
    var token = $('meta[name=csrf-token]').attr("content");
    var id = $(this).data('id');
    var url = "/students/" + id;
    elem = $(this);

    $.ajax({
      type: "PUT",
      url: url,
      dataType: 'json',
      data: { contact: { phone_number: newValue, source: "Import" }, _method:'put', authenticity_token: token},
      success: function(data, textStatus, jqXhr) {
        console.log("Country ", data.country)
        $(elem).parent().find('.flag').addClass(data.country_short_name).data('country', data.country);
      }
    });
  });
});
