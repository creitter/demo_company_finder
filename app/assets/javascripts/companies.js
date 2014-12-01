(function($) {
 var ready = function() {
   $("#add_contact").on("click", add_button_click);
   $(".remove-btn").on("click", remove_button_click);
 }
   
  function add_button_click(event) {
    event.stopPropagation();
    event.preventDefault();

    number_of_contacts = $(".contact").size();

    newly_added_contact = $(".new_contact").clone();
    $(newly_added_contact).removeClass("new_contact").addClass("contact");
    $(newly_added_contact).closest("div").prepend("<input type='hidden' id='company_contacts_attributes_" + number_of_contacts + "_id' name='company[contacts_attributes][" + number_of_contacts + "][id]' value='-1'>");

    $("#company_contact_name", newly_added_contact).attr("name","company[contacts_attributes][" + number_of_contacts + "][name]");
    $("#company_contact_name", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_name");

    $("#company_contact_email", newly_added_contact).attr("name", "company[contacts_attributes][" + number_of_contacts + "][email]");
    $("#company_contact_email", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_email");

    $("#company_contact_phone", newly_added_contact).attr("name","company[contacts_attributes][" + number_of_contacts + "][phone]");
    $("#company_contact_phone", newly_added_contact).attr("id", "company_contacts_attributes_" + number_of_contacts + "_id");
    $("#add_contact",newly_added_contact).remove();
    $(newly_added_contact).append("<input type='button' class='remove-btn' value='Remove'>");
    remove_btn = $(newly_added_contact).children('.remove-btn')
    
    $("#contact_list").append(newly_added_contact)
    $(remove_btn).on("click", {contact: newly_added_contact}, remove_button_click);

    $("#company_contact_name").val("");
    $("#company_contact_email").val("");
    $("#company_contact_phone").val("");
  }

  function remove_button_click(event) {
    if (event.data == undefined)
      $(this).closest(".contact").remove();
    else
      event.data.contact.remove();
    
  }
  
  //Compatability for regular pages
  $(document).ready(ready);
  
  //Rails 4.0 uses Turbolinks so we use on>page:load
  $(document).on("page:load", ready);
   
})(jQuery);
