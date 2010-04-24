# Beginning of the el4r block:
# RCtool generated this block automatically. DO NOT MODIFY this block!
# This is the el4r initialization file.
# End of the el4r block.
# User-setting area is below this line.

$:.unshift File.expand_path("~/.emacs.d/el4r/")

$:.unshift File.expand_path("~/.emacs.d/ext/xiki/")
customize_set_variable(:background_mode_type, :dark)
require 'xiki'
KeyBindings.keys
View.sensible_defaults
#Styles.use_xiki_color_scheme
FileTree.one_view_in_bar_by_default = true
View.horizontal_bar_size = 50


Keys.do_as_test { Keys.prefix == 8 ? rspec_run_file_drb : rspec_run_example_drb }
Keys.do_last_test { rspec_run_last_command }

set_face_background :trailing_whitespace, "#000000"
