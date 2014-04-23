
module Rubb
    class Person
        def initialize(id=0, name='')
            @id = id
            @name = name
        end

        def to_s
        	"(#{@id} - #{@name})"
        end

        def to_liquid
            hash = {}
            self.instance_variables.each {|var| hash[var.to_s.delete("@")] = self.instance_variable_get(var)}
            hash
        end

        public
        attr_accessor :id, :name
    end
end