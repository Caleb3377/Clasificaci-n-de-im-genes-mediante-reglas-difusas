function resultado = luk(matt)
    resultado = max(0, sum(matt, 2) - (size(matt, 2)-1));
end
