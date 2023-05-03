$(document).ready(function(){
    $('#pop-info').hide();
    window.addEventListener('message', event => {
        switch (event.data.action) {
            case 'open': {
                $(`#pop-info`).show()
                $(`#info-6`).show()
                $(`#obrazki`).show()
                $(`#przyciski`).show()
                break
            }
            case 'close': {
                $(`#pop-info`).hide()
                $(`#info-6`).hide()
                break
            }
        }
    });

    $(document).keyup(function(e) {
        if (e.key === "Escape") { // escape key maps to keycode `27`
            $.post("https://sunrp_weaponcraft/closeui", JSON.stringify({}));
            $(`#pop-info`).hide()
            $(`#info-6`).hide()
            $(`#obrazki`).hide()
            $(`#przyciski`).hide()
       }
   });
    
    $("#info-btn-6").click(function() {
        $.post("https://sunrp_weaponcraft/browning", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        $(`#obrazki`).hide()
        $(`#przyciski`).hide()
        return;
    })

    $("#info-btn-7").click(function() {
        $.post("https://sunrp_weaponcraft/vintage", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        $(`#obrazki`).hide()
        $(`#przyciski`).hide()
        return;
    })

    


    $("#info-btn-8").click(function() {
        $.post("https://sunrp_weaponcraft/deagle", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        $(`#obrazki`).hide()
        $(`#przyciski`).hide()
        return;
    })

    $("#info-btn-9").click(function() {
        $.post("https://sunrp_weaponcraft/m92", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        $(`#obrazki`).hide()
        $(`#przyciski`).hide()
        return;
    })

});