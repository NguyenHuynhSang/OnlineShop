var contact = {
    init: function () {
        contact.registerEvents();
    },
    registerEvents: function () {
        jQuery('#btnSend').off('click').on('click', function () {
            var name = jQuery('#txtName').val();
            var email = jQuery('#txtEmail').val();
            var tieude = jQuery('#txtTieuDe').val();
            var content = jQuery('#txtContent').val();

            
            jQuery.ajax({
                url: '/Contact/Send',
                type: 'POST',
                dataType: 'json',
                data: {
                    name: name,
                    email: email,
                    tieude: tieude,
                    content: content

                },
                success: function (res) {
                    if (res.status == true) {
                        window.alert('Gửi thành công');
                        contact.resetForm();

                    }

                }

            });
        });

    },
    resetForm: function () {
        jQuery('#txtName').val();
        jQuery('#txtEmail').val();
        jQuery('#txtTieuDe').val();
        jQuery('#txtContent').val();
    }
}

contact.init();