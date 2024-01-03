%% cargamos iris
load('iris.mat')

%% obtenemos los atributos features de cada ejemplo
dataset.X = round(iris.features, 1);

%% declaramos los mapas
numericalToCategoricalClassMap = containers.Map({1, 2, 3}, {'Iris-setosa', 'Iris-versicolor', 'Iris-virginica'});
categoricalToNumericalClassMap = containers.Map(values(numericalToCategoricalClassMap), keys(numericalToCategoricalClassMap));

%% Obtenemos las clases de los ejemplos
dataset.Y = (categoricalToNumericalClassMap('Iris-setosa'):categoricalToNumericalClassMap('Iris-virginica')) * [strcmp(iris.label, 'Iris-setosa');
                     strcmp(iris.label, 'Iris-versicolor');
                     strcmp(iris.label, 'Iris-virginica')];

%% Instanciamos los conjuntos para todos los ejemplos
conjuntos = construirConjuntos(dataset.X);

%% Particionamos los datos en Train y Test
partition.indexes.train = [1:25 51:75 101:125];
partition.X.train = dataset.X(partition.indexes.train,:);
partition.Y.train = dataset.Y(partition.indexes.train);
partition.indexes.test = [26:50 76:100 126:150];
partition.X.test = dataset.X(partition.indexes.test,:);
partition.Y.test = dataset.Y(partition.indexes.test);

%% Entrenar
%reglas será la matriz de reglas difusas, y valoresR será la matriz de
%valores reales con los que se han construido las reglas
[reglas, valoresR] = construirReglas(partition.X.train, partition.Y.train, conjuntos);

%% Testear
%acc es accuracy, y MC es matriz de confusion
[acc, MC] = clasificador(partition.X.test, partition.Y.test, reglas, conjuntos);

%% obtener la transformación de reglas matriciales a frases
frases = generarFrasesReglas(reglas);
for i = 1:numel(frases)
    disp(frases{i});
end

%% obtener la grafica de la regla indiceR
% etiquetas = {'BAJO', 'MEDIO', 'ALTO'};
% contenido = {'LARGO SEPALO', 'ANCHO SEPALO', 'LARGO PETALO', 'ANCHO PETALO'};
% subconjunto = {'A', 'B', 'C', 'D'};
% figure;
% indiceR = 14; 
% for j = 1:size(contenido,2)
%     r = conjuntos.(subconjunto{j})(reglas(indiceR, j),:);
%     subplot(4, 1, j);
%     plot(r);
%     hold on;
%     line([find(r == valoresR(indiceR, j), 1) find(r == valoresR(indiceR, j), 1)], ylim, 'Color', 'r', 'LineStyle', '--');
%     scatter(find(r == valoresR(indiceR, j), 1), valoresR(indiceR, j), 100, 'ro', 'filled');
%     title(cat(2, contenido(j), etiquetas(reglas(indiceR, j))));
% end

%% obtener las graficas de los conjuntos
%figure;
%subplot(4, 1, 1);
%plot(conjuntos.A(1, :), 'o-', 'DisplayName', 'Bajo');
%hold on;
%plot(conjuntos.A(2, :), 's-', 'DisplayName', 'Medio');
%plot(conjuntos.A(3, :), '^-', 'DisplayName', 'Alto');
%legend;
%title('Largo Sepalo');

%subplot(4, 1, 2);
%plot(conjuntos.B(1, :), 'o-', 'DisplayName', 'Bajo');
%hold on;
%plot(conjuntos.B(2, :), 's-', 'DisplayName', 'Medio');
%plot(conjuntos.B(3, :), '^-', 'DisplayName', 'Alto');
%legend;
%title('Ancho Sepalo');

%Graficar la tercera matriz
%subplot(4, 1, 3);
%plot(conjuntos.C(1, :), 'o-', 'DisplayName', 'Bajo');
%hold on;
%plot(conjuntos.C(2, :), 's-', 'DisplayName', 'Medio');
%plot(conjuntos.C(3, :), '^-', 'DisplayName', 'Alto');
%legend;
%title('Largo Petalo');

%subplot(4, 1, 4);
%plot(conjuntos.D(1, :), 'o-', 'DisplayName', 'Bajo');
%hold on;
%plot(conjuntos.D(2, :), 's-', 'DisplayName', 'Medio');
%plot(conjuntos.D(3, :), '^-', 'DisplayName', 'Alto');
%legend;
%title('Ancho Petalo');