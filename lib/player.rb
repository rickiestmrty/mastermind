class Player
    attr_reader :role, :code

    def initialize(role)
        @role = role

        if @role == "breaker"
            @code = []
        else
            createCode()
        end
    end

    def createCode
        @code = 4.times.map{ 1 + Random.rand(6) }
        if @code.uniq.length != @code.length
            createCode()
        end
    end

    def updateCode(newCode)
        @code = newCode
    end
end