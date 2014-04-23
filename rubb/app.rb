require 'rubygems'
require 'rack'
require 'liquid'
require_relative './db'

module Rubb
    class App
        def initialize
        end

        def call(env)
            route(Rack::Request.new env)
        end

        # Route the request to the appropriate place.
        def route(req)
            if req.path == '/'
                template = File.read('./views/index.html')
                template = Liquid::Template.parse(template)
                # template = template % {:people => Rubb::Data.get_all}
                # Do some template parsing here if I want.
                people = Rubb::Data.get_all
                puts people[0].instance_variables
                template = template.render('people' => people)
                return [200, {"Content-Type" => "text/html"}, [template]]
            end

            [404, {"Content-Type" => "text/html"}, [File.read('./views/404.html')]]
        end
    end
end
