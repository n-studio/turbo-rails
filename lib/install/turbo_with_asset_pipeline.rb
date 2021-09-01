if (app_js_path = Rails.root.join("app/javascript/application.js")).exist?
  say "Import turbo-rails in existing app/javascript/application.js"
  append_to_file app_js_path, %(import "@hotwired/turbo-rails"\n)
else
  say <<~INSTRUCTIONS, :red
    You must import @hotwired/turbo-rails in your application.js.
  INSTRUCTIONS
end

if (importmap_path = Rails.root.join("config/importmap.rb")).exist?
  say "Pin @hotwired/turbo-rails in config/importmap.rb"
  append_to_file importmap_path.to_s, %(pin "@hotwired/turbo-rails", to: "turbo.js"\n)
else
  say <<~INSTRUCTIONS, :red
    You must add @hotwired/turbo-rails to your importmap to reference them via ESM.
    Example: pin "@hotwired/turbo-rails", to: "turbo.js"
  INSTRUCTIONS
end
