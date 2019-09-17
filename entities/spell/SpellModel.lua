local Class = require("hump.class")

local SpellModel =
    Class {
    init = function(self, mp, name, effect, targets)
        self.mp = mp
        self.name = name
        self.effect = effect
        self.targets = targets
    end
}

return SpellModel
