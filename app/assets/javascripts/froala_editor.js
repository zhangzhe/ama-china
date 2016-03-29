//= require froala_editor.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/font_size.min.js
//= require plugins/image.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js

$(function() {
    $('.froala_editor').froalaEditor({
      heightMin: 300,
      placeholderText: '内容'
    }
    )
});
