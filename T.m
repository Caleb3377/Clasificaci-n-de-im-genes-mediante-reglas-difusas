function v = T(matt, modo)
    if strcmp(modo, 'min')
        v = min(matt, [], 2);
    end
    if strcmp(modo, 'prod')
        v = prod(matt, 2);
    end
    if strcmp(modo, 'luk')
        v = luk(matt);
    end
end