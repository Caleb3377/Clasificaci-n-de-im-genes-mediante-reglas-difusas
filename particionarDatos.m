function partition = particionarDatos(X, Y, sizeTrain)
    % Verifica que el tamaño de entrenamiento es válido
    if sizeTrain <= 0 || sizeTrain >= 1
        error('El tamaño de entrenamiento debe estar entre 0 y 1.');
    end
    uniquesY = unique(Y);
    num_classes = size(unique(Y), 2);
    rep_per_classes = hist(Y, uniquesY);
    disp(rep_per_classes);
    % Calcula el número de ejemplos para entrenamiento y prueba por clase
    numTrain = round(round(sizeTrain,1)*size(X, 1));%%con un decimal siempre sera multiplo
    numTest = size(X, 1) - numTrain;
    numPerClassTrain = numTrain/num_classes;
    numPerClassTest = numTest/num_classes;
    disp(numPerClassTest);
    disp(numPerClassTrain);
    if ~all(numPerClassTrain < rep_per_classes) || ~all(numPerClassTest < rep_per_classes)
        error('El numero de clases es insuficiente para dividir.');
    end
    indicesTrain = [];
    indicesTest = [];
    % Itera sobre cada clase
    for clase = 1:3
        % Encuentra los índices de ejemplos de esta clase
        indicesClase = find(Y == clase);
        % Toma los primeros numPerClassTrain para entrenamiento
        indicesTrain = cat(2, indicesTrain, indicesClase(1:numPerClassTrain));
        indicesTest = cat(2, indicesTest, indicesClase(numPerClassTrain+1:end));
    end
    partition = struct('X', struct('train', X(indicesTrain, :), 'test', X(indicesTest, :)), 'Y', struct('train', Y(indicesTrain), 'test', Y(indicesTest)));
end