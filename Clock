using Dates
import Base: +
import Base: -
import Base: ==
import Base: show
struct Clock
    hours::Integer
    minutes::Integer
    function Clock(hours,minutes)
        addhours= minutes ÷ 60
        minutes= minutes % 60
        if minutes < 0
            minutes= minutes + 60
            addhours -= 1
        end
        hours= (hours + addhours) % 24
        if hours < 0 
            hours += 24
        end
        new(hours,minutes)
    end
end
+( c::Clock, m::Minute)= Clock(c.hours,c.minutes+value(m))
-( c::Clock, m::Minute) = c + (-m)
==(a::Clock, b::Clock) = a.hours==b.hours && a.minutes==b.minutes
function show(io::IO, c::Clock)
    padded_s(n) = lpad(n, 2, '0')
    print(io, "\"$(padded_s(c.hours)):$(padded_s(c.minutes))\"")
end
