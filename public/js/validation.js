function validateForm(){
	/* Loop through fields with the class of "req" */
	for (var i = 0; i < add_contact.elements.length; i++) {
        if (add_contact.elements[i].className == "req" && add_contact.elements[i].value.length == 0) {
            alert('Please fill in all required fields');
            return false;
        }
    }
}

