
<% @alcohol_levels.each do |level| %>
<%= f.label(level) %>
<%= f.radio_button(:alcohol_level, level) %>
<% end %>
