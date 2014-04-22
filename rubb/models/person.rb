
module Rubb
    class Person
        def initialize(id=0, name='')
            @id = id
            @name = name
        end

        public
        attr_accessor :id, :name
    end
end