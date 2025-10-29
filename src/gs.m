% Classical Gram-Schmidt QR decomposition
function [Q, R] = gs(A)
    % 输入: A - m×n矩阵 (m >= n)
    % 输出: Q - m×n正交矩阵
    %       R - n×n上三角矩阵
    % 满足: A = Q*R
    
    [m, n] = size(A);
    
    % 检查输入矩阵维度
    if m < n
        error('矩阵行数必须大于等于列数');
    end
    
    % 初始化Q和R矩阵
    Q = zeros(m, n);
    R = zeros(n, n);
    
    % 经典Gram-Schmidt正交化过程
    for j = 1:n
        % 将A的第j列复制到v
        v = A(:, j);
        
        % 减去已正交化向量的投影
        for i = 1:j-1
            % 计算投影系数 R(i,j) = Q(:,i)' * A(:,j)
            R(i, j) = Q(:, i)' * A(:, j);
            % 从v中减去投影
            v = v - R(i, j) * Q(:, i);
        end
        
        % 计算R的对角元素（向量v的范数）
        R(j, j) = norm(v);
        
        % 检查线性相关性
        if R(j, j) < eps
            warning('矩阵列向量线性相关，R(%d,%d)接近零', j, j);
            Q(:, j) = v;  % 保持原向量
        else
            % 归一化得到正交向量
            Q(:, j) = v / R(j, j);
        end
    end
end