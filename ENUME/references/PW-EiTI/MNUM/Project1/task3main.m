function [] = task3main()
  A = [[14, -1, -6, 5],
        [1, -8, -4, -1],
        [1, -4, -12, -1],
        [1, -1, 8, -16]];
  b = [10; 0; -10; -20];
  x = gaussSeidelMethod(A, b);
  residuum = A*x - b;
  fprintf('Given example residuum norm %d \n', calculateNorm(residuum));
  fprintf('Results for example 1 with Gauss-Seidel method\n');
  [A b] = exampleGenerator(15, 1);
  display(gaussSeidelMethod(A, b));
  fprintf('Results for example 1 with Gauss Elimination with complete pivoting\n');
  display(gaussianEliminationCompletePivoting(A,b));
  fprintf('Results for example 2 with Gauss-Seidel method\n');
  [A b] = exampleGenerator(15, 2);
  display(gaussSeidelMethod(A, b));
  fprintf('Results for example 2 with Gauss Elimination with complete pivoting\n');
  display(gaussianEliminationCompletePivoting(A,b));
  fprintf('Results for example 3 with Gauss-Seidel method\n');
  [A b] = exampleGenerator(15, 3);
  display(gaussSeidelMethod(A, b));
  fprintf('Results for example 3 with Gauss Elimination with complete pivoting\n');
  display(gaussianEliminationCompletePivoting(A,b));
end