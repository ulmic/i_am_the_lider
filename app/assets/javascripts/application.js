//= require jquery
//= require underscore
//= require gmaps/google
//= require jquery_ujs
//= require ckeditor/init

var reformalOptions = {
    project_id: 98584,
    project_host: "lider_ulgood.reformal.ru",
    tab_orientation: "right",
    tab_indent: "50%",
    tab_bg_color: "#f9be27",
    tab_border_color: "#FFFFFF",
    tab_image_url: "http://tab.reformal.ru/T9GC0LfRi9Cy0Ysg0Lgg0L%252FRgNC10LTQu9C%252B0LbQtdC90LjRjw==/FFFFFF/2a94cfe6511106e7a48d0af3904e3090/left/1/tab.png",
    tab_border_width: 2
};

function refrm() {
        var script = document.createElement('script');
        script.type = 'text/javascript'; script.async = true;
        script.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'media.reformal.ru/widgets/v3/reformal.js';
        document.getElementsByTagName('head')[0].appendChild(script);
}
