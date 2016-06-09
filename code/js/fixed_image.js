// Calculate screen width and hide the image if the width is less then a specified value.
// It also put the image in fixed position, to make it fixed in the center of the screen also during scrolling
jQuery(document).ready(function () {
    if ($('body').hasClass('device-xxs') || $('body').hasClass('device-xs')) {
        jQuery(".img-rounded").css("display", "none");
    } else {
        jQuery(".img-rounded").css("display", "inline");
        
        // if it's visible, calculate the position of the image to be fixed on screen, if it is in the page
        if ($('*').hasClass('fixed_position_image')) {
            var screen_height = jQuery(window).height();
            var height = jQuery(".fixed_position_image").height();
            var width = jQuery(".fixed_position_image").width();    
            var p = jQuery( ".fixed_position_image" );
            var position = p.position();
            jQuery(".img-rounded").css("position", "fixed");
            jQuery(".img-rounded").css("left", p.offset().left + "px");
            jQuery(".img-rounded").css("width", width + "px");
        }
    }
});

jQuery(window).resize(function () {
    if ($('body').hasClass('device-xxs') || $('body').hasClass('device-xs')) {
        jQuery(".img-rounded").css("display", "none");
    } else {
        jQuery(".img-rounded").css("display", "inline");
        
        // if it's visible, calculate the position of the image to be fixed on screen
        if ($('*').hasClass('fixed_position_image')) {
            var screen_height = jQuery(window).height();
            var height = jQuery(".fixed_position_image").height();
            var width = jQuery(".fixed_position_image").width();    
            var p = jQuery( ".fixed_position_image" );
            var position = p.position();
            jQuery(".img-rounded").css("position", "fixed");
            jQuery(".img-rounded").css("left", p.offset().left + "px");
            jQuery(".img-rounded").css("width", width + "px");
        }
    }
});