class SpaceAge
    EARTH_YEAR_TO_SECONDS = 31_557_600.0
    ORBITAL_PERIODS = {
        earth: 1.0,
        mercury: 0.2408467,
        venus: 0.61519726,
        mars: 1.8808158,
        jupiter: 11.862615,
        saturn: 29.447498,
        uranus: 84.016846,
        neptune: 164.79132
    }
    def initialize(seconds)
        @seconds = seconds
    end
    def on_earth
        (@seconds / EARTH_YEAR_TO_SECONDS).round(2)
    end
    def on_mercury
        (on_earth / ORBITAL_PERIODS[:mercury]).round(2)
    end
    def on_venus
        (on_earth / ORBITAL_PERIODS[:venus]).round(2)
    end
    def on_mars
        (on_earth / ORBITAL_PERIODS[:mars]).round(2)
    end
    def on_jupiter
        (on_earth / ORBITAL_PERIODS[:jupiter]).round(2)
    end
    def on_saturn
        (on_earth / ORBITAL_PERIODS[:saturn]).round(2)
    end
    def on_uranus
        (on_earth / ORBITAL_PERIODS[:uranus]).round(2)
    end
    def on_neptune
        (on_earth / ORBITAL_PERIODS[:neptune]).round(2)
    end
end
