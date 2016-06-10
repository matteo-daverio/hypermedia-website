// Calculate screen width and hide the image if the width is less then a specified value.
// It also put the image in fixed position, to make it fixed in the center of the screen also during scrolling
jQuery(document).ready(function () {
    if ($('body').hasClass('device-xxs') || $('body').hasClass('device-xs')) {
        jQuery(".img-rounded").css("display", "none");
    } else {
        jQuery(".img-rounded").css("display", "inline");
    }
});

jQuery(window).resize(function () {
    if ($('body').hasClass('device-xxs') || $('body').hasClass('device-xs')) {
        jQuery(".img-rounded").css("display", "none");
    } else {
        jQuery(".img-rounded").css("display", "inline");
    }
});