import Base: ==, copy, intersect, isempty, issubset, iterate, length, push!, union!
mutable struct CustomSet{T} <: AbstractSet{T}
    elements::Vector{T}
    CustomSet(obj::AbstractVector{T}) where T = new{T}(sort!(unique(obj)))
end
length(obj::CustomSet) = length(obj.elements)
isempty(obj::CustomSet) = isempty(obj.elements)
iterate(obj::CustomSet) = iterate(obj.elements)
iterate(obj::CustomSet{Int64}, i) = iterate(obj.elements, i)
issubset(x::CustomSet, y::CustomSet) = issubset(x.elements, y.elements)
disjoint(x::CustomSet, y::CustomSet) = all(x ∉ y.elements for x ∈ x.elements)
==(x::CustomSet, y::CustomSet) = ==(x.elements, y.elements)
function push!(obj::CustomSet, element)
    x = findfirst(x -> x ≥ element, obj.elements)
    if x === nothing
        push!(obj.elements, element)
    elseif obj.elements[x] > element
        insert!(obj.elements, x, element)
    end
end
copy(obj::CustomSet) = CustomSet(obj.elements)
function intersect!(x::CustomSet, y::CustomSet)
    filter!(x -> x ∈ y, x.elements)
    x
end
intersect(x::CustomSet, y::CustomSet) = intersect!(copy(x), y)
function complement!(x::CustomSet, y::CustomSet)
    filter!(x -> x ∉ y, x.elements)
    x
end
complement(x::CustomSet, y::CustomSet) = complement!(copy(x), y)
function union!(x::CustomSet, y::CustomSet)
    foreach(elem -> push!(x, elem), y.elements)
    x
end
union(x::CustomSet, y::CustomSet) = union!(copy(x), y)
