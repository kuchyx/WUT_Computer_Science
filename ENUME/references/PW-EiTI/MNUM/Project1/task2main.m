function [] = task2main()
  fprintf('DATA 1\n');
  MAX_ITERATIONS = 2;
  vsize = zeros(MAX_ITERATIONS, 1);
  verr = zeros(MAX_ITERATIONS, 1);
  for i = 1:MAX_ITERATIONS
    size = 2^(i-1) * 10;
    fprintf('\n');
    fprintf('Size %d\n', size);
    [A, b] = exampleGenerator(size, 1);
    tic;
    X = gaussianEliminationCompletePivoting(A, b);
    fprintf('Time %d\n', toc);
    residuum = A*X - b;
    residuumErr = calculateNorm(residuum);
    fprintf('Error as residuum norm %d\n', residuumErr);
    vsize(i) = size;
    verr(i) = residuumErr;
  end
  figure();
  plot(vsize, verr, '.');
  title('Dane 1');
  fprintf('\nDATA 2\n');
  for i = 1:MAX_ITERATIONS
    size = 2^(i-1) * 10;
    fprintf('\n');
    fprintf('Size %d\n', size);
    [A, b] = exampleGenerator(size, 2);  
    tic;
    X = gaussianEliminationCompletePivoting(A, b);
    fprintf('Time %d\n', toc);
    residuum = A*X - b;
    residuumErr = calculateNorm(residuum);
    fprintf('Error as residuum norm %d\n', residuumErr);
    vsize(i) = size;
    verr(i) = residuumErr;
  end
  figure();
  plot(vsize, verr, '.');
  title('Dane 2');
  fprintf('\nDATA 3\n');
  for i = 1:MAX_ITERATIONS
    size = 2^(i-1) * 10;
    fprintf('\n');
    fprintf('Size %d\n', size);
    [A, b] = exampleGenerator(size, 3);    
    tic;
    X = gaussianEliminationCompletePivoting(A, b);
    fprintf('Time %d\n', toc);
    residuum = A*X - b;
    residuumErr = calculateNorm(residuum);
    fprintf('Error as residuum norm %d\n', residuumErr);
    vsize(i) = size;
    verr(i) = residuumErr;
  end
  figure();
  plot(vsize, verr, '.');
  title('Dane 3');
end