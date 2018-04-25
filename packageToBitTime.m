function bitTimeVector = packageToBitTime(packageTime, Nbits, Tbit)
    % Iremos trabalhar se o modelo for um vetor linha
    if size(packageTime, 1) == 1
        % Transformamos o vetor em um vetor coluna
        packageTime = packageTime';
    end
    
    bitTime = zeros(size(packageTime,1),Nbits);
    bitTimeVector = bitTime';
    bitTimeVector = bitTime(:);
    bitTimeVector(1) = packageTime(1);
    bitTimeVector(2) = packageTime(1) + Tbit/2; % Este vai ser o segundo 
    % elemento da matriz de sa�da, que nada mais � do que o valor inicial
    % da matriz, i.e., o tempo em que � iniciado um pacote completo, mais o
    % tempo da metade de um bit
    
    
    % Fizemos um vetor coluna com o n�mero de elementos igual ao da matriz de
    % sa�da, contendo o valor de in�cio de cada bit
    for i = 3:size(packageTime,1)*(Nbits)
        bitTimeVector(i) = bitTimeVector(i-1) + Tbit;
    end
%     bitTimeVectorStep = reshape(bitTimeVector, Nbits, size(packageTime,1));
%     bitTime = bitTimeVectorStep';
    
end