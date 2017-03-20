
$(document).on("change", "select#e1", function(e){
    console.log(this.value);
    $.ajax({
        url: "/centers/"+$(this).val(),
        dataType: "json",
        data: { id: this.value },

        success: function(data){
            console.log(data.phone);
            var center_phone = document.getElementById('center_phone');
            center_phone.value = data.phone;

            if (data.phone == undefined) {
            center_phone.value = null
            }
        }
    });
});
