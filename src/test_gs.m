% 测试函数
function test_gs()
    fprintf('\n=== 经典Gram-Schmidt QR分解测试 ===\n\n');
    
    % 测试1: 简单3×3矩阵
    fprintf('测试1: 3×3矩阵\n');
    A1 = [1 1 0;
          1 0 1;
          0 1 1];
    fprintf('原矩阵 A:\n');
    disp(A1);
    
    [Q1, R1] = gs(A1);
    fprintf('正交矩阵 Q:\n');
    disp(Q1);
    fprintf('上三角矩阵 R:\n');
    disp(R1);
    fprintf('验证 A = Q*R (误差):\n');
    disp(norm(A1 - Q1*R1, 'fro'));
    fprintf('验证 Q的正交性 (Q''*Q - I的误差):\n');
    disp(norm(Q1'*Q1 - eye(3), 'fro'));
    
    % 测试2: Hilbert矩阵（病态矩阵）
    fprintf('\n测试2: 4×4 Hilbert矩阵（病态）\n');
    n = 4;
    A2 = hilb(n);
    fprintf('条件数: %.2e\n', cond(A2));
    
    [Q2, R2] = gs(A2);
    fprintf('验证 A = Q*R (相对误差):\n');
    disp(norm(A2 - Q2*R2, 'fro')/norm(A2, 'fro'));
    fprintf('验证 Q的正交性 (Q''*Q - I的误差):\n');
    disp(norm(Q2'*Q2 - eye(n), 'fro'));
    
    % 测试3: 随机矩阵
    fprintf('\n测试3: 5×3随机矩阵\n');
    rng(42);  % 设置随机种子以保证可重复性
    A3 = randn(5, 3);
    
    [Q3, R3] = gs(A3);
    fprintf('验证 A = Q*R (误差):\n');
    disp(norm(A3 - Q3*R3, 'fro'));
    fprintf('验证 Q的正交性 (Q''*Q - I的误差):\n');
    disp(norm(Q3'*Q3 - eye(3), 'fro'));
    
    % 与MATLAB内置qr函数比较
    fprintf('\n与MATLAB内置qr函数比较:\n');
    [Q_matlab, R_matlab] = qr(A3, 0);  % 经济型QR分解
    fprintf('Q矩阵差异 (Frobenius范数):\n');
    % 注意：Q的符号可能不同，比较绝对值
    disp(min(norm(Q3 - Q_matlab, 'fro'), norm(Q3 + Q_matlab, 'fro')));
    
    fprintf('\n注意：经典Gram-Schmidt算法对于病态矩阵可能不够稳定。\n');
    fprintf('实际应用中，修正Gram-Schmidt算法或Householder变换更稳定。\n');
end