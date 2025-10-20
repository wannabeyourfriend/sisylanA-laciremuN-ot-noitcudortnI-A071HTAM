**UC San Diego, Fall 2025**

---

**Name:** Zixuan Wang

**PID:** A19247820

---

### Problem 1

Proof：

If  $Ax=b$ has two solutions $x_1$ and $x_2$, then

$$
A x_1 = b \quad\text{and}\quad A x_2 = b.
$$

Subtracting gives

$$
A(x_1-x_2)=A x_1 - A x_2 = b-b=0.
$$

By the hypothesis there is no nonzero y with $Ay=0$, so $A(x_1-x_2)=0$ → $x_1-x_2=0$. Hence $x_1=x_2$. Therefore for any $b \in \mathbb{R}^n)$  there can be at most one  $x\in\mathbb{R}^n$ with $Ax=b$

---

### Problem 2

### **(a)**

Given $A x = b$

where  $A$ is **upper triangular**, so  $a_{ij} = 0$  for all  $i > j$ .

Thus

$$
a_{ii} x_i + a_{i,i+1} x_{i+1} + \cdots + a_{in} x_n = b_i.
$$

So, solving for  $x_i$ 

$$

x_i = \frac{1}{a_{ii}} \left( b_i - \sum_{j=i+1}^{n} a_{ij} x_j \right)\\
x_n = \frac{b_n}{a_{nn}}
$$

### **(b)**

```matlab
function x = backSub(U, b)
	n = length(b);
	x = zeros(n,1);
	for i = n:-1:1
    s = 0;
    for j = i+1:n
		  s = s + U(i,j) * x(j);
    end
    x(i) = (b(i) - s) / U(i,i);
	end
end
```

---

### Problem 3

### (a)

Let $A$ be an $n \times n$ invertible upper triangular matrix. $a_{ij} = 0$ for $i > j$, since $A$ is invertible, all its diagonal entries are non-zero, i.e., $a_{kk} \neq 0$ for $k = 1, \dots, n$

$$
x_k = \frac{1}{a_{kk}} \left( b_k - \sum_{j=k+1}^{n} a_{kj} x_j \right)
$$

For $k=n$, $x_n = \frac{1}{a_{nn}} (b_n)$ Since $n \ge i+1$ (assuming $i < n$), we have $b_n = 0$ by the problem's condition. **Thus, $x_n = 0$**.

**Assume** that for some integer  $k$  such that  $i+1 < k \le n$, we have $x_j = 0$ for all $j \ge k$.  Using the backward substitution formula for $x_{k-1}$:
$x_{k-1} = \frac{1}{a_{k-1, k-1}} \left( b_{k-1} - \sum_{j=k}^{n} a_{k-1, j} x_j \right)$
$\sum_{j=k}^{n} a_{k-1, j} x_j = a_{k-1, k} (0) + a_{k-1, k+1} (0) + \dots + a_{k-1, n} (0) = 0$
The equation simplifies to:
$x_{k-1} = \frac{b_{k-1}}{a_{k-1, k-1}}$ Since we are in the case where $k-1 > i$ by the problem's condition we have $b_{k-1} = 0$. Thus, $x_{k-1} = 0$

By the principle of induction, we have **shown that** **$x_k = 0 \quad \forall k = i+1, i+2, \dots, n.$**

Next, we show that $x_i \neq 0$.
For $k=i$ the backward substitution formula is:
$x_i = \frac{1}{a_{ii}} \left( b_i - \sum_{j=i+1}^{n} a_{ij} x_j \right)$
From the result we just proved, $x_j = 0$ for all $j > i$. This makes the summation term zero:
$\sum_{j=i+1}^{n} a_{ij} x_j = a_{i, i+1} (0) + a_{i, i+2} (0) + \dots + a_{i, n} (0) = 0$
The equation for  $x_i$  simplifies to
$x_i = \frac{b_i}{a_{ii}}$ 

We are given that $b_i \neq 0$, and since A is invertible, its diagonal entry $a_{ii} \neq 0$. Therefore, **$x_i \neq 0$**

This completes the proof that the solution vector $x$ has the same pattern of zeros as $b.$

### (b)

Let $C = A^{-1}$. To show that C is upper triangular,  i.e., $c_{ij} = 0 \quad \forall \quad i > j.$

Let $c_j$ be the j-th column of the matrix C. By the definition of an inverse matrix, $AC=I$, where I is the identity matrix. This relationship can be considered column by column. The j-th column of the product AC is $Ac_j,$ and the j-th column of the identity matrix is the standard basis vector $e_j$. Thus, for each $j = 1, \dots, n$, the column vector $c_j$ is the unique solution to the linear system:
$A c_j = e_j$
The vector **$e_j$** has a 1 in the j-th position and 0s in all other positions. Specifically, the last non-zero entry of $e_j$ is at position j. This means $(e_j)_j = 1$ $\neq 0$ and $(e_j)_k = 0 \forall k > j.$

This system $A c_j = e_j$  fits the exact conditions of part (a), with $x = c_j$ and $b = e_j$. The index of the last non-zero component of the vector on the right-hand side is $i=j$.

Applying the result from part (a), the solution vector $c_j$ must have the same pattern of zeros as $e_j.$ That is, the components of $c_j$  must be zero for all indices greater than j.
$(c_j)_k = 0 \quad \text{for all } k > j$
Therefore:
*$C_{kj} = 0 \quad \text{for all } k > j$*

Thus, the inverse matrix $A^{-1}$ is upper triangular.

---

### Problem 4

### (a)

![截屏2025-10-10 23.43.43.png](attachment:c179e9aa-a517-491d-80f1-cf4f56ac949d:截屏2025-10-10_23.43.43.png)

### (b)

![截屏2025-10-10 23.43.47.png](attachment:205f6c48-6237-4117-9606-0d95b03eb97d:截屏2025-10-10_23.43.47.png)

### (c)

### **Method 1: (AB)x**

**Step 1: Flops for `C = A * B`**
To calculate a single element `C(i,j)`, we compute the sum:
`C(i,j) = A(i,1)*B(1,j) + A(i,2)*B(2,j) + ... + A(i,n)*B(n,j)`
Flops for C = `n^2 * 2n = 2n^3`

**Step 2: Flops for `result = C * x`**
To calculate a single element `result(i)`, we compute the sum:
`result(i) = C(i,1)*x(1) + C(i,2)*x(2) + ... + C(i,n)*x(n)`
Flops for result = `n * 2n = 2n^2`

Total = (Flops for Step 1) + (Flops for Step 2) = $2n^3+2n^2$

The computational complexity is dominated by the highest order term, so this method is $O(n^3)$.

### **Method 2: A(Bx)**

**Step 1: Flops for `y = B * x`**
This is a standard matrix-vector product. 
Flops for y = `n * 2n = 2n^2`

**Step 2: Flops for `result = A * y`**
This is another standard matrix-vector product, which also requires:
Flops for result = `n * 2n = 2n^2`

**Total Flops for A(Bx):**

Total = (Flops for Step 1) + (Flops for Step 2) = $2n^2+2n^2=4n^2$

The computational complexity of this method is $O(n^2)$.

The second approach, **A(Bx)**, is significantly better and more efficient. An $O(n^3)$ algorithm's runtime grows **cubically** with the size of the input `n`, while an O(n^2) algorithm's runtime grows quadratically. For any non-trivial value of `n` (e.g., `n > 2`), the n^3 term will be much larger than the n^2 term, making the first method far slower