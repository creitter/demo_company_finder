(function($) {
 var ready = function() {
   $('#add_contact').on('click', function(event) {
     event.stopPropagation();
     event.preventDefault();

     number_of_contacts = $(".contact").size();

     newly_added_contact = $(".new_contact").clone();
     $(newly_added_contact).removeClass("new_contact");
     $(newly_added_contact).closest("div").prepend("<input type='hidden' id='company_contacts_attributes_" + number_of_contacts + "_id' name='company[contacts_attributes][" + number_of_contacts + "][id]' value='-1'>");

     $("#company_contact_name", newly_added_contact).attr("name","company[contacts_attributes][" + number_of_contacts + "][name]");
     $("#company_contact_name", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_name");

     $("#company_contact_email", newly_added_contact).attr("name", "company[contacts_attributes][" + number_of_contacts + "][email]");
     $("#company_contact_email", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_email");

     $("#company_contact_phone", newly_added_contact).attr("name","company[contacts_attributes][" + number_of_contacts + "][phone]");
     $("#company_contact_phone", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_id");

     $("#contact_list").append(newly_added_contact)

     $("#company_contact_name").val("");
     $("#company_contact_email").val("");
     $("#company_contact_phone").val("");
     
     // data = {
     //   id: $("#company_id").val(),
     //   name: $("#company_contact_name").val(),
     //   email: $("#company_contact_email").val(),
     //   phone: $("#company_contact_phone").val()
     // }
     
     // $.ajax({
     //   type: "POST",
     //   url: "/companies/add_contact",
     //   data: data,
     //   success: function(data, textStatus) {
     //       alert('success')
     //   },
     //   error: function(event, jqxhr, settings, thrownError) {
     //     alert('fail')
     //   }
     // });

   })  
  }
  
  //Compatability for regular pages
  $(document).ready(ready);
  
  //Rails 4.0 uses Turbolinks so we use on>page:load
  $(document).on('page:load', ready);
   
})(jQuery);
