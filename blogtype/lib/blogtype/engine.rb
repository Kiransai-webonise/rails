module Blogtype
  class Engine < ::Rails::Engine
    isolate_namespace Blogtype
    config.autoload_paths += %W(#{config.root}/lib/modules)
  end
end
