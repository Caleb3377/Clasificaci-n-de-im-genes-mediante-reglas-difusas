function subconjuntos = construirSubconjuntos(referencial, modo)
    if strcmp(modo, 'gaussmf')
        media = mean(referencial);
        desviacion = std(referencial) / 3;
        BAJO = gaussmf(referencial, [desviacion, referencial(1)]);
        MEDIO = gaussmf(referencial, [desviacion, media]);
        ALTO = gaussmf(referencial, [desviacion, referencial(end)]);
    else
        mini = referencial(1);
        maxi = referencial(end);
        media = mean([mini, maxi]);
        if strcmp(modo, 'trimf')
            BAJO = trimf(referencial, [mini, mini, media]);
            MEDIO = trimf(referencial, [mini, media, maxi]);
            ALTO = trimf(referencial, [media, maxi, maxi]);
        else
            BAJO = trapmf(referencial, [mini, mini, mean([mini, media]), media]);
            MEDIO = trapmf(referencial, [mean([mini, media]), media, mean([media, maxi]), maxi]);
            ALTO = trapmf(referencial, [mean([media, maxi]), maxi, maxi, maxi]);
        end
    end
    subconjuntos = [BAJO; MEDIO; ALTO];
end
